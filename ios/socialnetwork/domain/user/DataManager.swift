//
//  DataManager.swift
//  socialnetwork
//
//  Created by Alan Quintiliano on 14/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import CoreData
import Combine
import UIKit

class DataManager {

    private static func context() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }

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

    func executeAsync<T, U>(_ block: @escaping (Future<T, U>.Promise) -> Void) -> AnyPublisher<T, U> {
        return Future<T, U> { promise in
            DispatchQueue.main.async {
                block(promise)
            }
        }
        .subscribe(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
