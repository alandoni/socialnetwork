//
//  PostsListViewModel.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 12/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine
import Foundation

class PostsListViewModel: ObservableObject {

    @Published var posts = [Post]()
    @Published var error: String?
    @Published var loading: Bool = false
    @Published var newPost: String = ""
    
    var job: Cancellable? = nil

    func load() {
        self.loading = true
        self.job = GetPostsUseCase(postRepository: PostRepositoryImpl(postService: PostService())).execute()?.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                self.error = error.localizedDescription
                break
            }
            self.loading = false
        }, receiveValue: { posts in
            self.posts = posts
        })
    }

    func onTapPost() {
        self.loading = true
        let date = Int64(Date().timeIntervalSince1970)
        let post = Post(id: String(self.posts.count), user: User.loggedUser!, text: self.newPost, date: date, reactions: Dictionary())
        self.job = CreatePostUseCase(postRepository: PostRepositoryImpl(postService: PostService())).execute(post: post)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                self.error = error.localizedDescription
                break
            }
            self.loading = false
        }, receiveValue: { post in
            self.posts.append(post)
        })
    }

    func onReactToPost(post: Post, reactionType: ReactionType) {
        var reactions = post.reactions[reactionType.rawValue] ?? 0
        reactions += 1

        var postCopy = Post(id: post.id, user: post.user, text: post.text, date: post.date, reactions: post.reactions)
        postCopy.reactions[reactionType.rawValue] = reactions

        let date = Int64(Date().timeIntervalSince1970)
        let reaction = Reaction(id: post.id, user: post.user, post: postCopy, reactionType: reactionType, date: date)

        self.job = ReactToPostUseCase(postRepository: PostRepositoryImpl(postService: PostService())).execute(reaction: reaction)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                self.error = error.localizedDescription
                break
            }
            self.loading = false
        }, receiveValue: { newPost in
            let position = self.posts.firstIndex(of: post)
            if (position != nil) {
                self.posts.remove(at: position!)
                self.posts.insert(newPost, at: position!)
            } else {
                self.posts.append(newPost)
            }
        })
    }
}
