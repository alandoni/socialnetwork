//
//  UserService.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 14/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine

class UserService {
    func login(login: Login) -> AnyPublisher<User, Error> {
        let api = LoginApi(body: login)
        return HttpClient().request(api: api)
    }
}
