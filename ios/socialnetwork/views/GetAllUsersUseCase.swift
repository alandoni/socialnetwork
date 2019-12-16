//
//  GetAllUsersUseCase.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 14/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine

class GetAllUsersUseCase {
    let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func execute() -> AnyPublisher<[User], Error> {
        return self.userRepository.retrieveAll()
    }
}
