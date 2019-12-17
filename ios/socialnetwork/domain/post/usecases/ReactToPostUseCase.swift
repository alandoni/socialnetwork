//
//  ReactToPostUseCase.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 17/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine

class ReactToPostUseCase {
    let postRepository: PostRepository

    init(postRepository: PostRepository) {
        self.postRepository = postRepository
    }

    func execute(reaction: Reaction) -> AnyPublisher<Post, Error> {
        let reactionPublisher = self.postRepository.storeReaction(reaction: reaction)
        let postPublisher = self.postRepository.storePost(post: reaction.post)
        return postPublisher.zip(reactionPublisher)
            .flatMap { post, reaction -> AnyPublisher<Post, Error> in
                return self.postRepository.reactToPost(reaction: reaction)
            }.eraseToAnyPublisher()
    }
}
