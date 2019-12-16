//
//  AppNavigationView.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 16/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import SwiftUI

struct AppNavigationView: View {
    
    var body: some View {
        ZStack {
            if (User.loggedUser != nil) {
                PostsListView()
            } else {
                LoginView()
            }
        }
    }
}
