//
//  File.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine

protocol PostRepository {
    func storePost(post: Post) -> AnyPublisher<Post, Error>

    func createPost(post: Post) -> AnyPublisher<Post, Error>

    func getPosts() -> AnyPublisher<[Post], Error>

    func readPosts() -> AnyPublisher<[Post], Error>

    func storeReaction(reaction: Reaction) -> AnyPublisher<Reaction, Error>

    func reactToPost(reaction: Reaction) -> AnyPublisher<Post, Error>
}
