//
//  MainMenu.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 10/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

class MainMenu : SKScene {
    var btnProx : Button!
    var btnLevel : Button!
    
    override func didMove(to view: SKView) {
        
        btnProx = self.childNode(withName: "BtnProx") as? Button
        
        btnProx.onTap = {self.loadLevel()}
        
        btnLevel = self.childNode(withName: "btnLevel") as? Button
        
        btnLevel.onTap = {self.loadLevels()}
    }
    
    func loadLevel() {
        
        guard let view = (self.view ?? nil) else {
            return
        }

        guard let scene = GameScene(fileNamed: "PhasesScene") else {
            return
        }

        scene.scaleMode = .aspectFill

        view.showsPhysics = true
        view.showsDrawCount = true
        view.showsFPS = true

        view.presentScene(scene, transition: .push(with: .left, duration: 1))
    }
    
    func loadLevels()
    {
        
    }
}
