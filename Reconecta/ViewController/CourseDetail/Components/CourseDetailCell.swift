//
//  CourseDetailCell.swift
//  Reconecta
//
//  Created by Everson Pereira Trindade on 08/03/20.
//  Copyright © 2020 HackAFRO. All rights reserved.
//

import UIKit

class CourseDetailCell: UITableViewCell {

    var mock: DataMock?
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillCell(dataMock: DataMock?) {
        mock = dataMock
        userImage.image = UIImage(named: dataMock?.image ?? "")
        nameLbl.text = dataMock?.name ?? ""
    }
}
