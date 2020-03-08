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
        if userKind == UserKind.ong {
            companyButton.isHidden = false
        }
    }
    
    @IBOutlet weak var confirmButton: UIButton! {
        didSet {
            self.confirmButton.layer.cornerRadius = 26.0
            self.confirmButton.clipsToBounds = true
        }
    }
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var companyButton: UIButton! {
        didSet {
            self.companyButton.isHidden = true
            self.companyButton.layer.cornerRadius = 26.0
            self.companyButton.clipsToBounds = true
        }
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToHome(_ sender: Any) {
        showLoader()
        viewModel.shouldLogin(email: userTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @IBAction func registerNewCompanyAction(_ sender: Any) {
        guard let companyViewController = UIStoryboard(name: "Company", bundle: nil).instantiateViewController(withIdentifier: String(describing: CompanyViewController.self)) as? CompanyViewController else {
            return
        }
        companyViewController.initView(delegate: self)
        present(companyViewController, animated: true, completion: nil)
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
    
    func didRegisterNewCompany(_ did: Bool) {
        dismissLoader()
        if did {
            showDefaultAlert(message: "Sucesso ao cadastrar novo OSC :)", completeBlock: nil)
            return
        }
        showDefaultAlert(message: "Erro ao cadastrar nova OSC :/", completeBlock: nil)
    }
}

extension LoginViewController: CompanyViewControllerDelegate {
    func registerCompany(cnpj: String) {
        showLoader()
        viewModel.shouldRegisterNewCompany(cnpj: cnpj)
    }
}
