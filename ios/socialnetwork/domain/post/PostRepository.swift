//
//  File.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine

protocol PostRepository {
    func createPost(post: PostResponse) -> AnyPublisher<PostResponse, Error>?

    func getPosts() -> AnyPublisher<[PostResponse], Error>?
}
