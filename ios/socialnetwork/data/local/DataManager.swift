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

    static func context() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
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
