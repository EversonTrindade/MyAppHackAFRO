//
//  CourseViewModel.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 08/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import Foundation

protocol CourseViewToModelProtocol: class {
    func saveNewCourse()
    func saveNewAlumini(cpf: String)
}

protocol CourseModelToViewProtocol: class {
    func savedNewCourse(_ did: Bool)
    func savedNewAlumini(_ did: Bool)
}

class CourseViewModel: CourseViewToModelProtocol {
    
    private weak var delegate: CourseModelToViewProtocol?
    
    init(_ delegate: CourseModelToViewProtocol?) {
        self.delegate = delegate
    }
    
    func saveNewCourse() {
//        let params = ["": ""]
//        Request().request(url: BaseAPI().course, params: params, httpMethod: HTTP.post.method, success: { data in
//            self.delegate?.savedNewCourse(true)
//        }) { err in
//            self.delegate?.savedNewCourse(false)
//        }
    }
    
    func saveNewAlumini(cpf: String) {
        let params = ["cpf": "\(cpf)", "id": "0"]
        Request().request(url: BaseAPI().alumini, params: params, httpMethod: HTTP.post.method, success: { data in
            self.delegate?.savedNewAlumini(true)
        }) { err in
            self.delegate?.savedNewAlumini(false)
        }
    }
}
