//
//  ContentView.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 12/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import SwiftUI
import UIKit
import Combine

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.startAnimating()
        return indicator
    }

    func updateUIView(_ uiView: UIActivityIndicatorView,
                      context: Context) {
        // Start and stop UIActivityIndicatorView animation
    }
}

struct PostsListView: View {
    @ObservedObject var viewModel = PostsListViewModel()

    var body: some View {
        NavigationView() {
            VStack {
                if (self.viewModel.error != nil) {
                    Text(self.viewModel.error ?? "")
                }
                if (self.viewModel.loading) {
                    ActivityIndicator()
                }
                TextField("No que está pensando?", text: $viewModel.newPost)
                Button(action: {
                    self.viewModel.onTapPost()
                }, label: {
                    Text("Postar")
                })
                List(self.viewModel.posts) { post in
                    Text(post.text)
                }
            }.onAppear {
                self.viewModel.load()
            }
        }.navigationBarTitle("Posts")
    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListView()
    }
}
