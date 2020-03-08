//
//  CourseViewController.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 08/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController {

    var userKind: UserKind?
    
    @IBOutlet weak var navigationTitle: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    func initView(kind: UserKind?) {
        self.userKind = kind
    }
    
    func configView() {
        switch userKind {
        case .alumini:
            navigationTitle.topItem?.title = "Cadastrar Alumini"
            break
        case .course:
            navigationTitle.topItem?.title = "Cadastrar Curso"
            break
        default:
            return
        }
    }

    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
