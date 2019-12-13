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
    let url = URL(string: "http://192.168.0.1")!
    //public var cancellable: AnyCancellable? = nil

    enum HTTPError: LocalizedError {
        case statusCode
    }

    func request<T: Codable, U: Codable>(api: Api<T, U>) -> AnyPublisher<U, Error>? {
        var request = URLRequest(url: self.url.appendingPathComponent(api.url))
        request.httpMethod = api.method
        if (api.body != nil) {
            request.httpBody = try! JSONEncoder().encode(api.body)
        }
        return URLSession.shared.dataTaskPublisher(for: request)
        .tryMap { output in
            guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                throw HTTPError.statusCode
            }
            return output.data
        }
        .decode(type: api.responseType!, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
