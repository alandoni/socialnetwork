//
//  UserRepository.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 14/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine

protocol UserRepository {
    func store(user: User) -> AnyPublisher<User, Error>
    func login(login: Login) -> AnyPublisher<User, Error>
    func retrieveAll() -> AnyPublisher<[User], Error>
}
