//
//  RemoteRequester.swift
//  socialnetwork
//
//  Created by Alan Donizete Quintiliano on 13/12/19.
//  Copyright © 2019 Alan Donizete Quintiliano. All rights reserved.
//

import Combine
import Foundation

class RemoteRequester {
    let url = URL(string: "http://192.168.15.10:8080")!

    enum HTTPError: LocalizedError {
        case statusCode
    }

    func request<T: Codable, U: Codable>(api: Api<T, U>) -> AnyPublisher<U, Error> {
        var request = URLRequest(url: self.url.appendingPathComponent(api.url))
        request.httpMethod = api.method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        if (api.body != nil) {
            request.httpBody = try! JSONEncoder().encode(api.body!)
        }
        return URLSession.shared.dataTaskPublisher(for: request)
        .handleEvents(receiveSubscription: { (sub) in
                print(sub)
            }, receiveOutput: { (response) in
                print(response)
            }, receiveCompletion: { (completion) in
                print(completion)
            }, receiveCancel: {
                print("Cancel")
            }, receiveRequest: { (demand) in
                print(demand)
            })
        .tryMap { output in
            guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                throw HTTPError.statusCode
            }
            return output.data
        }
        .decode(type: api.responseType, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
