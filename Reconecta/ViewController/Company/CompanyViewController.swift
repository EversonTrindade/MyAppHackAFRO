//
//  CompanyViewController.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 08/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import UIKit

protocol CompanyViewControllerDelegate: class {
    func registerCompany(cnpj: String)
}

class CompanyViewController: UIViewController {

    private weak var delegate: CompanyViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var cnpjTextField: UITextField!
    
    
    func initView(delegate: CompanyViewControllerDelegate?) {
        self.delegate = delegate
    }
    
    @IBAction func saveCompanyAction(_ sender: Any) {
        dismiss(animated: true) {
            self.delegate?.registerCompany(cnpj: self.cnpjTextField.text ?? "")
        }
    }
}
