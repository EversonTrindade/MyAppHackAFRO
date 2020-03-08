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
    @IBAction func addCourseAction(_ sender: Any) {
        chooseOption()
    }
}

extension HomeViewController {
    func goToAddCourse(option: UserKind) {
        guard let courseViewController = UIStoryboard(name: "Course", bundle: nil).instantiateViewController(withIdentifier: String(describing: CourseViewController.self)) as? CourseViewController else {
            return
        }
        courseViewController.initView(kind: option)
        present(courseViewController, animated: true, completion: nil)
    }
    
    func chooseOption() {
        let alert = UIAlertController.init(title: "Selecione uma opção", message: nil, preferredStyle: .actionSheet)
        let courseOpt = UIAlertAction.init(title: "Cursos", style: .default) { _ in
            self.goToAddCourse(option: .course)
        }
        let aluminiOpt = UIAlertAction.init(title: "Alumini", style: .default) { _ in
            self.goToAddCourse(option: .alumini)
        }
        let cancelOpt = UIAlertAction.init(title: "Cancelar", style: .cancel) { _ in }
        alert.addAction(courseOpt)
        alert.addAction(aluminiOpt)
        alert.addAction(cancelOpt)
        present(alert, animated: true, completion: nil)
    }
}
