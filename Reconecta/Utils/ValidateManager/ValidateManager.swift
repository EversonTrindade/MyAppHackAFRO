//
//  ValidateManager.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 07/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import Foundation

enum ServiceError {
    case unknown
    var message: String {
        switch self {
        case .unknown:
            return "Unknown error, try again later"
        }
    }
}
