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

    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(post.date)))
    }

    var body: some View {
        HStack {
            VStack {
                HStack {
                    Group {
                        Text(self.post.user.name)
                            .foregroundColor(Colors.primaryTextColor.toColor())
                        Spacer()
                        Text(self.getDate())
                    }
                }
                HStack {
                    Group {
                        Text(self.post.text)
                        Spacer()
                    }.padding(EdgeInsets(top: 8.0, leading: 0, bottom: 8.0, trailing: 0))
                }
                HStack {
                    Group {
                        Text(String(format: "Gostei: %d", self.post.reactions[ReactionType.LIKE.rawValue] ?? 0))
                    }.onTapGesture {
                        self.action(ReactionType.LIKE)
                    }.padding(.leading, 10)
                        .padding(.trailing, 10)

                    Group {
                        Text(String(format: "Não gostei: %d", self.post.reactions[ReactionType.DISLIKE.rawValue] ?? 0))
                    }.onTapGesture {
                        self.action(ReactionType.DISLIKE)
                    }.padding(.leading, 10)
                        .padding(.trailing, 10)
                }
            }.padding()
        }.border(Colors.borderColor.toColor())
            .background(Colors.sectionBackgroundColor.toColor())
            .listRowBackground(Colors.backgroundColor.toColor())
    }
}

struct PostsListView: View {
    @ObservedObject var viewModel = PostsListViewModel()

    init() {
        UITableView.appearance().backgroundColor = Colors.backgroundColor
        UITableView.appearance().separatorStyle = .none
    }

    var body: some View {
        VStack {
            VStack {
                HStack {
                    TextField("No que está pensando?", text: $viewModel.newPost)
                    Button(action: {
                        self.viewModel.onTapPost()
                    }, label: {
                        Text("Postar")
                    })
                }.padding()
                    .border(Colors.borderColor.toColor())
                    .background(Colors.sectionBackgroundColor.toColor())
                if (self.viewModel.error != nil) {
                    HStack {
                        HStack {
                            Text(self.viewModel.error ?? "")
                                .foregroundColor(Colors.warningTextColor.toColor())
                        }.padding()
                            .border(Colors.warningBorderColor.toColor())
                            .background(Colors.warningBackgroundColor.toColor())
                    }.padding()
                        .border(Colors.borderColor.toColor())
                        .background(Colors.sectionBackgroundColor.toColor())
                        .scaledToFill()
                }
                if (self.viewModel.loading) {
                    ActivityIndicator()
                }
            }.padding()
            List {
                ForEach(self.viewModel.posts, id: \.self) { post in
                    PostView(post: post, action: { (reactionType: ReactionType) in
                        self.viewModel.onReactToPost(post: post, reactionType: reactionType)
                    })
                }
            }.background(Colors.backgroundColor.toColor())
        }.onAppear {
            self.viewModel.load()
        }
    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListView()
    }
}
