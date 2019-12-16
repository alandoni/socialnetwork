//
//  Post.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

struct Post: Codable, Identifiable {
    var id: Int
    var user: Int
    var text: String
}
