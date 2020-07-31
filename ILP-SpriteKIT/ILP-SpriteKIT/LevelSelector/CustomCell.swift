//
//  CustomCell.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 13/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var lblNumber: UILabel!
    
    func defineCell(value : String){
        lblNumber.text = value
        
        self.layer.borderColor = UIColor.white.cgColor//CGColor.init(srgbRed: 1, green: 1, blue: 1, alpha: 1)
        self.layer.borderWidth = 5
        self.layer.cornerRadius = 10
    }
}
