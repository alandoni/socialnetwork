//
//  LoginViewModel.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine

class LoginViewModel: ObservableObject {

    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var error: String? = nil
    @Published var loading: Bool = false
    @Published var loggedUser: User? = nil

    var job: Cancellable? = nil

    func load() {
        self.loading = true
        self.job = GetAllUsersUseCase(userRepository: UserRepositoryImpl(userService: UserService())).execute()
            .sink(receiveCompletion: { completion in
                switch (completion) {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error.localizedDescription
                    break
                }
                self.loading = false
            }) { users in
                if (users.count > 0) {
                    self.setLoggedUser(user: users[0])
                }
            }
    }

    func didTapLogin() {
        self.loading = true
        let login = Login(username: self.userName, password: self.password)
        self.job = LoginUseCase(userRepository: UserRepositoryImpl(userService: UserService())).execute(login: login)
            .sink(receiveCompletion: { completion in
                switch (completion) {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error.localizedDescription
                    break
                }
                self.loading = false
            }, receiveValue: { user in
                self.setLoggedUser(user: user)
            })
    }

    func setLoggedUser(user: User) {
        User.loggedUser = user
        self.loggedUser = user
    }
}
