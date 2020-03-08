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
    lazy var viewModel: CourseViewToModelProtocol = CourseViewModel(self)
    
    @IBOutlet weak var navigationTitle: UINavigationBar!
    @IBOutlet weak var inputInfo: UITextField!
    
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

    @IBAction func saveInfoAction(_ sender: Any) {
        switch userKind {
        case .alumini:
            showLoader()
            viewModel.saveNewAlumini(cpf: inputInfo.text ?? "")
            break
        case .course:

            break
        default:
            return
        }
    }
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CourseViewController: CourseModelToViewProtocol {
    func savedNewCourse(_ did: Bool) {
        
        if did {
            return
        }
    }
    
    func savedNewAlumini(_ did: Bool) {
        dismissLoader()
        if did {
            showDefaultAlert(message: "Alumini salvo com sucesso :)") { _ in
                self.dismiss(animated: true, completion: nil)
            }
            return
        }
        showDefaultAlert(message: "Erro ao salvar Alumini :/", completeBlock: nil)
    }
}
