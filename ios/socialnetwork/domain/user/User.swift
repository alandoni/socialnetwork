//
//  User.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 14/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

struct User: Codable {
    var id: String
    var name: String
    var email: String

    static var loggedUser: User? = nil
}
