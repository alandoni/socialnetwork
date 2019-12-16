//
//  LoginUseCase.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 14/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine

class LoginUseCase {
    let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository;
    }

    func execute(login: Login) -> AnyPublisher<User, Error> {
        return self.userRepository.login(login: login).flatMap { user -> AnyPublisher<User, Error> in
            return self.userRepository.store(user: user)
        }.eraseToAnyPublisher()
    }
}
