//
//  File.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

class GetPostsApi: Api<PostResponse, [PostResponse]> {
    override init() {
        super.init()
        self.method = "GET"
        self.body = nil;
        self.responseType = [PostResponse].self
    }
}
