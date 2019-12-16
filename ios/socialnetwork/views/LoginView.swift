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
        ZStack {
            if (self.viewModel.loggedUser == nil) {
                VStack {
                    TextField("User", text: $viewModel.userName)
                    TextField("Password", text: $viewModel.password)

                    if (self.viewModel.error != nil) {
                        Text(self.viewModel.error ?? "")
                    }
                    if (self.viewModel.loading) {
                        ActivityIndicator()
                    }
                    Button(action: {
                        self.viewModel.didTapLogin()
                    },
                    label: {
                        Text("Login")
                    })
                }.padding()
            } else {
                PostsListView()
            }
        }.onAppear {
            self.viewModel.load()
        }
    }
}
