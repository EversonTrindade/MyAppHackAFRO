//
//  Request.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 07/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import Foundation

class Request: Requestable {
    func request(url: String, params: [String: Any]?, httpMethod: String,
                 success: @escaping (_ result: Data?) -> Void, error: @escaping (_ error: String?) -> Void) {
        
        guard let urle = URL(string: url) else {
            error(ServiceError.unknown.message)
            return
        }
        
        var urlRequest = URLRequest(url: urle)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = httpMethod
        if httpMethod == HTTP.post.method {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params ?? [String: Any]())
        }
        URLSession.shared.dataTask(with: urlRequest) { data, response, err  in
            if let _ = err {
                error(ServiceError.unknown.message)
                return
            }
            guard let _ = data else {
                error(ServiceError.unknown.message)
                return
            }
            success(data)
        }.resume()
    }
}
