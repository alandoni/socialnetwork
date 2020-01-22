//
//  LoginView.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import SwiftUI
import Combine

struct AppView: View {
    @ObservedObject var viewModel = LoginViewModel()

    init() {
        UINavigationBar.appearance().barTintColor = Colors.primaryColor
        UINavigationBar.appearance().tintColor = Colors.buttonColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:Colors.buttonColor]
    }

    func isLoggedIn() -> Bool {
        do {
            return try UserDao().syncGetUsers().count > 0
        } catch {
            return false
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                Colors.backgroundColor.toColor()
                ZStack {
                    if (self.viewModel.loggedUser == nil) {
                        LoginView(viewModel: self.viewModel).padding()
                    } else {
                        PostsListView()
                    }
                }
            }.onAppear {
                self.viewModel.load()
            }.navigationBarTitle(
                Text("Social Network"), displayMode: .inline
            )
        }
    }
}
