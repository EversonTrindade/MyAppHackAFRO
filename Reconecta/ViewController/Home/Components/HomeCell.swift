//
//  HomeCell.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 08/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var closedCourseLbl: UILabel!
    
    func initCell(course: Course?) {
        titleLbl.text = course?.name ?? ""
        numberLbl.text = "\(course?.numberStudent ?? 0)"
        if course?.active ?? false == false {
            contentView.backgroundColor = .darkGray
            closedCourseLbl.text = "Curso fechado"
        } else {
            closedCourseLbl.text = "Nome"
        }
    }
}
