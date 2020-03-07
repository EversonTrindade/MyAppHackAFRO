//
//  WelcomeViewController.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 07/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        goToLogin()
    }
}

extension WelcomeViewController {
    func goToLogin() {
        guard let loginViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as? LoginViewController else {
            return
        }
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}
