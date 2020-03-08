//
//  CourseDetailViewController.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 08/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import UIKit

struct DataMock {
    var name = ""
    var image = ""
}

class CourseDetailViewController: UIViewController {
    
    private var data: [DataMock] = [DataMock(name: "Lázaro", image: "lazaro"), DataMock(name: "Daiana", image: "Oval")]

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.register(UINib(nibName: String(describing: CourseDetailCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CourseDetailCell.self))
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CourseDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CourseDetailCell.self), for: indexPath) as? CourseDetailCell else {
            return UITableViewCell()
        }
        cell.fillCell(dataMock: data.object(index: indexPath.row) ?? DataMock())
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
}
