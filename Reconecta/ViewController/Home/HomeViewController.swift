//
//  HomeViewController.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 07/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var viewModel: HomeViewToModelProtocol = HomeViewModel(self)
    private var kind: UserKind?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.register(UINib(nibName: String(describing: HomeCell.self), bundle: nil), forCellReuseIdentifier: String(describing: HomeCell.self))
            self.tableView.tableFooterView = UITableViewCell()
            self.tableView.isHidden = true
        }
    }
    @IBOutlet weak var createNewItemButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showLoader()
        viewModel.shouldGetCourses()
    }
    
    func initView(kind: UserKind) {
        self.kind = kind
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Já vai? :/", message: nil, preferredStyle: .alert)
        let logOut = UIAlertAction(title: "Sim", style: .destructive) { _ in
            self.dismiss(animated: true, completion: nil)
        }
        let stay = UIAlertAction(title: "Não", style: .default, handler: nil)
        alertController.addAction(logOut)
        alertController.addAction(stay)
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func addCourseAction(_ sender: Any) {
        if kind == UserKind.alumini {
            showDefaultAlert(message: "Desconsidere esse botão", completeBlock: nil)
            return
        }
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
        let alert = UIAlertController(title: "Selecione uma opção", message: nil, preferredStyle: .actionSheet)
        let courseOpt = UIAlertAction(title: "Cursos", style: .default) { _ in
            self.goToAddCourse(option: .course)
        }
        let aluminiOpt = UIAlertAction(title: "Alumini", style: .default) { _ in
            self.goToAddCourse(option: .alumini)
        }
        let cancelOpt = UIAlertAction(title: "Cancelar", style: .cancel) { _ in }
        alert.addAction(courseOpt)
        alert.addAction(aluminiOpt)
        alert.addAction(cancelOpt)
        present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeCell.self), for: indexPath) as? HomeCell else {
            return UITableViewCell()
        }
        return cell
    }
}

extension HomeViewController: HomeModelToViewProtocol {
    func didGetCourses(_ did: Bool) {
        dismissLoader()
        if did {
            DispatchQueue.main.async {
                self.tableView.isHidden = false
                self.tableView.reloadData()
            }
            return
        }
        showDefaultAlert(message: "Erro ao buscar cursos. :/") { _ in
            self.dismiss(animated: true, completion: nil)
        }
    }
}
