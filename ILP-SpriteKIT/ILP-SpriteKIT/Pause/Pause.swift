//
//  Pause.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 28/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

class Pause: SKScene {
    var btnResume : SKSpriteNode!
    var btnRestart : SKSpriteNode!
    var btnMenu : SKSpriteNode!
    
    override func didMove(to view: SKView) {
        btnResume = self.childNode(withName: "Resume") as! SKSpriteNode
        btnRestart = self.childNode(withName: "Restart") as! SKSpriteNode
        btnMenu = self.childNode(withName: "Menu") as! SKSpriteNode
        
        btnRestart.isUserInteractionEnabled = true
        btnResume.isUserInteractionEnabled = true
        btnMenu.isUserInteractionEnabled = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
        
        let node = self.atPoint(location!)
        print(location)
        if (node.name == "Resume") {
            print("asd")
        }
    }
}
