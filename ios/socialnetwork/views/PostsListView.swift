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

    var body: some View {
        VStack {
            Text(self.post.user.name)
        }
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
                List(self.viewModel.posts) { post in
                    Text(post.text)
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
