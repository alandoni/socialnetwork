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

    func storePost(post: Post) -> AnyPublisher<Post, Error> {
        return PostsDao().savePost(post: post)
    }

    func readPosts() -> AnyPublisher<[Post], Error> {
        return PostsDao().getPosts()
    }

    func createPost(post: Post) -> AnyPublisher<Post, Error> {
        return self.postService.postPost(post: post)
    }

    func getPosts() -> AnyPublisher<[Post], Error> {
        return self.postService.getPosts()
    }

    func storeReaction(reaction: Reaction) -> AnyPublisher<Reaction, Error> {
        return PostsDao().saveReaction(reaction: reaction)
    }

    func reactToPost(reaction: Reaction) -> AnyPublisher<Post, Error> {
        return self.postService.reactToPost(reaction: reaction)
    }
}
