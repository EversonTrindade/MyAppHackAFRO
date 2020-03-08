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
    
    func initCell(course: Course?) {
        titleLbl.text = course?.name ?? ""
    }
}
