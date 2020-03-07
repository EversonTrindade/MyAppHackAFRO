//
//  Manager.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 07/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import Foundation

enum HTTP {
    case get
    case post
    var method: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}

protocol Requestable: class {
    func request(url: String, params: [URLQueryItem]?, httpMethod: String, authorization: String?, completion: @escaping (_ result: Data?,_ error: String?) -> Void)
}
