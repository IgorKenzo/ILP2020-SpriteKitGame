//
//  File.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 10/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

class Button : SKSpriteNode {
    var onTap : () -> Void = {print("teste")}
    
    required init?(coder aDecoder: NSCoder) {
        
        /* Call parent initializer e.g. SKSpriteNode */
        super.init(coder: aDecoder)
        
        /* Enable touch on button node */
        self.isUserInteractionEnabled = true
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isUserInteractionEnabled = false
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.onTap()
        self.isUserInteractionEnabled = true
    }
}
