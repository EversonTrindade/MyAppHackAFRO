//
//  BaseModel.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 08/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import Foundation

import Foundation

typealias Mappable = Codable & Equatable & Decodable & Encodable

infix operator <-->

func <--> <T: Mappable>(jsonData: Data?, type: T.Type) -> T? {
    guard let data = jsonData else {
        return nil
    }
    return try? JSONDecoder().decode(T.self, from: data)
}

func jsonToData(json: Any?) -> Data? {
    if let dict = json as? NSDictionary {
        if let data = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) {
            return data
        }
    }
    return Data()
}

func arrayToData(array: Any?) -> Data? {
    if let dict = array as? NSArray {
        if let data = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) {
            return data
        }
    }
    return Data()
}
