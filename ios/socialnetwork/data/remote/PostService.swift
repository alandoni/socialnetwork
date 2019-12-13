//
//  PostService.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine

class PostService {

    func postPost(post: PostResponse) -> AnyPublisher<PostResponse, Error>? {
        let api = PostPostApi(body: post)
        return RemoteRequester().request(api: api)
    }

    func getPosts() ->  AnyPublisher<[PostResponse], Error>? {
       let api = GetPostsApi()
       return RemoteRequester().request(api: api)
   }
}
