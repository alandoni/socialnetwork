//
//  UserRepositoryImpl.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 14/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine

class UserRepositoryImpl: UserRepository {
    let userService: UserService

    init(userService: UserService) {
        self.userService = userService
    }

    func store(user: User) -> AnyPublisher<User, Error> {
        return DataManager().saveUser(user: user)
    }

    func login(login: Login) -> AnyPublisher<User, Error> {
        return userService.login(login: login)
    }

    func retrieveAll() -> AnyPublisher<[User], Error> {
        return DataManager().getUsers()
    }


}
