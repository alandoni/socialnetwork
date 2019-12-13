//
//  Api.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

class Api<T: Codable, U: Codable> {
    var method: String = "GET"
    var url: String = ""
    var body: T? = nil
    var responseType: U.Type? = nil
}
