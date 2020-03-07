//
//  Request.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 07/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import Foundation

class Request: Requestable {
    func request(url: String, params: [URLQueryItem]?, httpMethod: String, authorization: String?, completion: @escaping (Data?, String?) -> Void) {
        var urlComponents = URLComponents(string: url)
        if let params = params {
            urlComponents?.queryItems = params
        }
        guard let url = urlComponents?.url else {
            completion(nil, ServiceError.unknown.message)
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.url = url
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let auth = authorization {
            urlRequest.addValue(auth, forHTTPHeaderField: "Authorization")
        }
        urlRequest.httpMethod = httpMethod
        URLSession.shared.dataTask(with: urlRequest) { data,_, error  in
            if let _ = error {
                completion(nil, ServiceError.unknown.message)
                return
            }
            guard let _ = data else {
                completion(nil, ServiceError.unknown.message)
                return
            }
            completion(data, nil)
        }.resume()
    }
}
