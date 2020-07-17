//
//  NodeButton.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 17/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

class NodeButton: SKNode {
    var image : SKShapeNode?
    var label: SKLabelNode?
    var action : (() -> Void)?
    
    init(image: SKShapeNode, label: SKLabelNode, action: @escaping () -> Void) {
        self.image = image
        self.label = label
        self.action = action
        super.init()
        
        self.isUserInteractionEnabled = true
        self.addChild(image)
        
        label.verticalAlignmentMode = .center
        label.fontSize = 45
        self.addChild(label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isUserInteractionEnabled = false
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.action!()
        self.isUserInteractionEnabled = true
    }
}
