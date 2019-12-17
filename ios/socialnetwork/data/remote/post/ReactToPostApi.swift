//
//  ReactToPostApi.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 17/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

class ReactToPostApi: Api<Reaction, Post> {
    init(reaction: Reaction) {
        super.init()
        self.url = String(format: "post/%@/reaction", reaction.post.id)
        self.method = "POST"
        self.body = reaction
    }
}
