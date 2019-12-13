//
//  PostsListViewModel.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 12/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine

class PostsListViewModel: ObservableObject {

    @Published var posts = [PostResponse]()
    @Published var error: String?
    @Published var loading: Bool = false
    @Published var newPost: String = ""
    

    func load() {
        self.loading = true
        GetPostsUseCase(postRepository: PostRepositoryImpl(postService: PostService())).execute()?.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                self.error = error.localizedDescription
                break
            }
            self.loading = false
        }, receiveValue: { posts in
            print(posts)
            self.posts = posts
        })
    }

    func onTapPost() {
        self.loading = true
        CreatePostUseCase(postRepository: PostRepositoryImpl(postService: PostService())).execute(post: PostResponse(id: self.posts.count, user: 1, text: self.newPost))?.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                self.error = error.localizedDescription
                break
            }
            self.loading = false
        }, receiveValue: { post in
            print(post)
            self.posts.append(post)
        })
    }
}
