//
//  HomeViewController.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 07/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func initView() {
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
