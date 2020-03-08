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
    func shouldRegisterNewCompany(cnpj: String)
}

protocol LoginModelToViewProtocol: class {
    func loginSuccess(_ did: Bool)
    func didRegisterNewCompany(_ did: Bool)
}

class LoginViewModel: LoginViewToModelProtocol {

    private weak var delegate: LoginModelToViewProtocol?
    
    init(_ delegate: LoginModelToViewProtocol?) {
        self.delegate = delegate
    }
    
    func shouldLogin(email: String, password: String) {
        delegate?.loginSuccess(true)
    }
    
    func shouldRegisterNewCompany(cnpj: String) {
        let params = ["cnpj": "\(cnpj)", "id": "0"]
        Request().request(url: BaseAPI().company, params: params, httpMethod: HTTP.post.method, success: { data in
            self.delegate?.didRegisterNewCompany(true)
        }) { err in
            self.delegate?.didRegisterNewCompany(false)
        }
    }
}
