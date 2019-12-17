//
//  Post.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

struct Post: Codable, Identifiable, Equatable {
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }

    var id: String
    var user: User
    var text: String
    var date: Int64
    var reactions: Dictionary<String, Int>
}
