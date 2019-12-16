//
//  GetPostsUseCase.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine

class GetPostsUseCase {
    let postRepository: PostRepository

    init(postRepository: PostRepository) {
        self.postRepository = postRepository
    }

    func execute() -> AnyPublisher<[Post], Error>? {
        return self.postRepository.getPosts()
    }
}
