//
//  Reaction.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 17/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

struct Reaction: Codable {
    var id: String
    var user: User
    var post: Post
    var reactionType: ReactionType
    var date: Int64
}

enum ReactionType: String, Codable {
    case LIKE = "like"
    case DISLIKE = "dislike"
}
