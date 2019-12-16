//
//  LoginApi.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 14/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import UIKit

class LoginApi: Api<Login, User> {
    init(body: Login) {
        super.init()
        self.body = body
        self.method = "POST"
        self.url = "login"
    }
}
