//
//  LoginViewController.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 07/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LoginViewController {
    func goTohome() {
        guard let homeViewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as? HomeViewController else {
            return
        }
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}
