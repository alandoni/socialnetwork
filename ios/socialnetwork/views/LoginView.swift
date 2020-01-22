//
//  LoginView.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 21/01/20.
//  Copyright © 2020 Alan Donizete Quintiliano. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            VStack {
                Text("Login")
                    .foregroundColor(Colors.primaryTextColor.toColor())
                    .font(Font.system(size: 28.0))
                TextField("User", text: $viewModel.userName)
                    .padding()
                    .border(Colors.borderColor.toColor())
                TextField("Password", text: $viewModel.password)
                    .padding()
                    .border(Colors.borderColor.toColor())
            }.padding(.bottom, 8.0)

            if (self.viewModel.error != nil) {
                HStack {
                    Text(self.viewModel.error ?? "")
                        .foregroundColor(Colors.errorTextColor.toColor())
                }.padding()
                    .border(Colors.errorBorderColor.toColor())
                    .background(Colors.errorBackgroundColor.toColor())
            }
            if (self.viewModel.loading) {
                ActivityIndicator()
            }
            Button(action: {
                self.viewModel.didTapLogin()
            }) {
                HStack {
                    Text("Entrar").foregroundColor(Colors.buttonColor.toColor())
                }
                .accentColor(Colors.buttonColor.toColor())
                .padding(EdgeInsets(top: 6.0, leading: 12.0, bottom: 6.0, trailing: 12.0))
                .background(Colors.primaryColor.toColor())
            }
        }.padding()
            .border(Colors.borderColor.toColor())
            .background(Colors.sectionBackgroundColor.toColor())
    }
}
