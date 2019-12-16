//
//  PostPostApi.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Foundation

class PostPostApi: Api<Post, Post> {

    init(body: Post) {
        super.init()
        self.method = "POST"
        self.body = body;
        self.url = "post"
    }
}
