//
//  HomeViewModel.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 08/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import Foundation

protocol HomeViewToModelProtocol: class {
    func shouldGetCourses()
    func getCoursesCount() -> Int
    func getCourse(by index: Int) -> Course 
}

protocol HomeModelToViewProtocol: class {
    func didGetCourses(_ did: Bool)
}

class HomeViewModel: HomeViewToModelProtocol {
    
    private weak var delegate: HomeModelToViewProtocol?
    private var courses: [Course]?
    
    init(_ delegate: HomeModelToViewProtocol?) {
        self.delegate = delegate
    }
    
    func shouldGetCourses() {
        Request().request(url: BaseAPI().courses, params: nil, httpMethod: HTTP.get.method, success: { data in
            self.courses = data <--> [Course].self
            self.delegate?.didGetCourses(true)
        }) { err in
            self.delegate?.didGetCourses(true)
        }
    }
    
    func getCoursesCount() -> Int {
        return courses?.count ?? 0
    }
    
    func getCourse(by index: Int) -> Course {
        guard let course = courses?.object(index: index) else {
            return Course()
        }
        return course
    }
}
