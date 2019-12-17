//
//  File.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine

class CreatePostUseCase {
    let postRepository: PostRepository

    init(postRepository: PostRepository) {
        self.postRepository = postRepository
    }

    func execute(post: Post) -> AnyPublisher<Post, Error> {
        return self.postRepository.storePost(post: post).flatMap { post -> AnyPublisher<Post, Error> in
            return self.postRepository.createPost(post: post)
        }.eraseToAnyPublisher()
    }
}
