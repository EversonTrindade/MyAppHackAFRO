//
//  BaseAPI.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 08/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import Foundation

struct BaseAPI {
    
    private let base = "https://cryptic-waters-55666.herokuapp.com"
    
    var alumini: String {
        return base + "/api/v1/alumini"
    }
    
    var course: String {
        return base + "/api/v1/course"
    }
    
    var company: String {
        return base + "/api/v1/company"
    }
    
    var courses: String {
        return base + "/api/v1/courses"
    }
}
