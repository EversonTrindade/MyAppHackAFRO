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
    
    private var userKind: UserKind = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var ongButton: UIButton! {
        didSet {
            self.ongButton.layer.cornerRadius = 26.0
            self.ongButton.clipsToBounds = true
        }
    }
    @IBOutlet weak var aluminiButton: UIButton! {
        didSet {
            self.aluminiButton.layer.cornerRadius = 26.0
            self.aluminiButton.clipsToBounds = true
        }
    }
    @IBAction func aluminiButtonAction(_ sender: Any) {
        goToLogin(userKind: .alumini)
        userKind = .alumini
    }
    
    @IBAction func ongButtonAction(_ sender: Any) {
        goToLogin(userKind: .ong)
        userKind = .ong
    }
    
    // MARK: Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifier.segue {
            if let tabBarController = segue.destination as? UITabBarController {
                if let navigationController = tabBarController.viewControllers?.object(index: 0) as? UINavigationController {
                    if let homeViewController = navigationController.viewControllers.object(index: 0) as? HomeViewController {
                        homeViewController.initView(kind: userKind)
                    }
                }
            }
        }
    }
}

extension WelcomeViewController {
    func goToLogin(userKind: UserKind?) {
        guard let loginViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as? LoginViewController else {
            return
        }
        loginViewController.initView(self, userKind: userKind)
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
