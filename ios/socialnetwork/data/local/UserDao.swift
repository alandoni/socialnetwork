//
//  UserDao.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 16/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import CoreData
import Combine

class UserDao: DataManager {
    func saveUser(user: User) -> AnyPublisher<User, Error> {
        return self.executeAsync() { promise in
            let userData = UserData(context: DataManager.context())
            userData.id = Int16(user.id) ?? 0
            userData.name = user.name
            userData.email = user.email

            do {
                try DataManager.context().save()
                promise(.success(user))
            } catch (let error) {
                promise(.failure(error))
            }
        }
    }

    func getUsers() -> AnyPublisher<[User], Error> {
        return self.executeAsync() { promise in
            let request: NSFetchRequest<UserData> = UserData.fetchRequest()
            do {
                let list = try DataManager.context().fetch(request)
                let users = list.map { (userData: UserData) -> User in
                    let user = User(id: String(userData.id), name: userData.name ?? "", email: userData.email ?? "")
                    return user
                }
                promise(.success(users))
            } catch (let error) {
                promise(.failure(error))
            }
        }
    }
}
