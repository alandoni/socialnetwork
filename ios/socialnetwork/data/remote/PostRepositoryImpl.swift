//
//  PostRepository.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine

class PostRepositoryImpl: PostRepository {
    let postService: PostService;

    init(postService: PostService) {
        self.postService = postService
    }

    func createPost(post: PostResponse) -> AnyPublisher<PostResponse, Error>? {
        return self.postService.postPost(post: post)
    }

    func getPosts() -> AnyPublisher<[PostResponse], Error>? {
        return self.postService.getPosts()
    }
}
