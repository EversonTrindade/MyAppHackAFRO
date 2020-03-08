//
//  CourseViewController.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 08/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import UIKit

protocol CourseViewControllerDelegate: class {
    func reloadView()
}

class CourseViewController: UIViewController {

    var userKind: UserKind?
    lazy var viewModel: CourseViewToModelProtocol = CourseViewModel(self)
    private weak var delegate: CourseViewControllerDelegate?
    
    @IBOutlet weak var navigationTitle: UINavigationBar!
    @IBOutlet weak var numberOfStudents: UITextField!
    @IBOutlet weak var inputInfo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    func initView(kind: UserKind?, delegate: CourseViewControllerDelegate?) {
        self.userKind = kind
        self.delegate = delegate
    }
    
    func configView() {
        switch userKind {
        case .alumini:
            navigationTitle.topItem?.title = "Cadastrar Alumini"
            inputInfo.placeholder = "CPF"
            inputInfo.keyboardType = .numberPad
            numberOfStudents.isHidden = true
            break
        case .course:
            navigationTitle.topItem?.title = "Cadastrar Curso"
            inputInfo.placeholder = "Nome"
            inputInfo.keyboardType = .default
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
            viewModel.saveNewCourse(name: inputInfo.text ?? "", number: numberOfStudents.text ?? "")
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
            showDefaultAlert(message: "Curso salvo com sucesso ;)") { _ in
                self.dismiss(animated: true) {
                    self.delegate?.reloadView()
                }
            }
            return
        }
        showDefaultAlert(message: "Erro ao salvar curso :/", completeBlock: nil)
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
