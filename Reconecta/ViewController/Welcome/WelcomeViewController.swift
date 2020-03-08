//
//  WelcomeViewController.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 07/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import UIKit

fileprivate struct identifier {
    static let segue = "segueToHome"
}

class WelcomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        goToLogin()
    }
    
    // MARK: Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifier.segue {
            if let tabBarController = segue.destination as? UITabBarController {
                if let navigationController = tabBarController.viewControllers?.object(index: 0) as? UINavigationController {
                    if let homeViewController = navigationController.viewControllers.object(index: 0) as? HomeViewController {
                        homeViewController.initView()
                    }
                }
            }
        }
    }
}

extension WelcomeViewController {
    func goToLogin() {
        guard let loginViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as? LoginViewController else {
            return
        }
        loginViewController.initView(self)
        present(loginViewController, animated: true, completion: nil)
        
    }
    
    func gotToTabBar() {
        performSegue(withIdentifier: identifier.segue, sender: nil)
    }
}

extension WelcomeViewController: LoginViewControllerDelegate {
    func didLogin() {
        gotToTabBar()
    }
}
