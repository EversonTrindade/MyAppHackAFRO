//
//  LoginViewController.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 07/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate: class {
    func didLogin()
}

class LoginViewController: UIViewController {

    private weak var delegate: LoginViewControllerDelegate?
    private lazy var viewModel: LoginViewToModelProtocol = LoginViewModel(self)
    
    func initView(_ delegate: LoginViewControllerDelegate?) {
        self.delegate = delegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToHome(_ sender: Any) {
        dismiss(animated: true) {
            self.delegate?.didLogin()
        }
    }
}

extension LoginViewController: LoginModelToViewProtocol {
    func loginSuccess(_ did: Bool) {
        if did {
            return
        }
    }
}
