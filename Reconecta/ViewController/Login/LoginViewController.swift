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
    private var userKind: UserKind?
    
    func initView(_ delegate: LoginViewControllerDelegate?, userKind: UserKind?) {
        self.delegate = delegate
        self.userKind = userKind
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func dismissAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToHome(_ sender: Any) {
        showLoader()
        viewModel.shouldLogin(email: userTextField.text ?? "", password: passwordTextField.text ?? "")
    }
}

extension LoginViewController: LoginModelToViewProtocol {
    func loginSuccess(_ did: Bool) {
        dismissLoader()
        if did {
            dismiss(animated: true, completion: nil)
            delegate?.didLogin()
            return
        }
        showDefaultAlert(message: "Erro no sistema", completeBlock: nil)
    }
}
