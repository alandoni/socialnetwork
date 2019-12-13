//
//  LoginView.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()

    var body: some View {
        VStack {
            TextField("User", text: $viewModel.userName)
            TextField("Password", text: $viewModel.password)
            Button(action: {
                self.viewModel.didTapLogin()
            },
            label: {
                Text("Login")
            })
        }
    }
}
