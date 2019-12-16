//
//  File.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

class GetPostsApi: Api<Post, [Post]> {
    override init() {
        super.init()
        self.url = "post"
    }
}
