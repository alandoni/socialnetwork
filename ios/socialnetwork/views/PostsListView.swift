//
//  ContentView.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 12/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import SwiftUI
import Combine

struct PostView: View {
    let post: Post
    let action: (ReactionType) -> Void

    var body: some View {
        VStack {
            Text(self.post.user.name)
            Text(self.post.text)
            HStack {
                Group {
                    Text(String(format: "%d Curtida", self.post.reactions[ReactionType.LIKE.rawValue] ?? 0))
                }.onTapGesture {
                    self.action(ReactionType.LIKE)
                }.padding()
                Group {
                    Text(String(format: "%d Descurtida", self.post.reactions[ReactionType.DISLIKE.rawValue] ?? 0))
                }.onTapGesture {
                    self.action(ReactionType.DISLIKE)
                }.padding()
            }
        }.padding()
    }
}

struct PostsListView: View {
    @ObservedObject var viewModel = PostsListViewModel()

    var body: some View {
        NavigationView() {
            VStack {
                if (self.viewModel.error != nil) {
                    Text(self.viewModel.error ?? "")
                }
                if (self.viewModel.loading) {
                    ActivityIndicator()
                }
                HStack {
                    TextField("No que está pensando?", text: $viewModel.newPost)
                    Button(action: {
                        self.viewModel.onTapPost()
                    }, label: {
                        Text("Postar")
                    })
                }.padding()
                List(self.viewModel.posts.map({post in post})) { post in
                    PostView(post: post, action: { (reactionType: ReactionType) in
                        self.viewModel.onReactToPost(post: post, reactionType: reactionType)
                    })
                }
            }.onAppear {
                self.viewModel.load()
            }
        }.navigationBarTitle("Posts", displayMode: .inline)
    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListView()
    }
}
