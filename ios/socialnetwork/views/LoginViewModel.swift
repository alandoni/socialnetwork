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

    func didTapLogin() { }
}
