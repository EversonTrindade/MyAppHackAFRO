//
//  LoginViewModel.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 07/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import Foundation

protocol LoginViewToModelProtocol: class {
    func shouldLogin(email: String, password: String)
}

protocol LoginModelToViewProtocol: class {
    func loginSuccess(_ did: Bool)
}

class LoginViewModel: LoginViewToModelProtocol {

    private weak var delegate: LoginModelToViewProtocol?
    
    init(_ delegate: LoginModelToViewProtocol?) {
        self.delegate = delegate
    }
    
    func shouldLogin(email: String, password: String) {
        delegate?.loginSuccess(true)
    }
}
