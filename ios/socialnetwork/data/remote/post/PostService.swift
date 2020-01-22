//
//  PostService.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine

class PostService {

    func postPost(post: Post) -> AnyPublisher<Post, Error> {
        let api = PostPostApi(body: post)
        return HttpClient().request(api: api)
    }

    func getPosts() -> AnyPublisher<[Post], Error> {
       let api = GetPostsApi()
       return HttpClient().request(api: api)
    }

    func reactToPost(reaction: Reaction) -> AnyPublisher<Post, Error> {
        let api = ReactToPostApi(reaction: reaction)
        return HttpClient().request(api: api)
    }
}
