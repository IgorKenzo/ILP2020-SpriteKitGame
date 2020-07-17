//
//  MainMenu.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 10/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

class MainMenu : SKScene {
    
    var actionsDelegate : ActionsDelegate?
    
    override func didMove(to view: SKView) {
        
        loadButton()
        levelButton()
    }
    
    func loadButton(){
        
        let label = SKLabelNode(text: "Continue")
        label.fontName = "Helvetica-Bold"
        
        let background = SKShapeNode(rectOf: CGSize(width: label.fontSize * CGFloat(label.text!.count), height: label.fontSize * 2), cornerRadius: 10)
        background.lineWidth = 5
        
        
        let btn = NodeButton(image: background, label: label, action: {self.loadLevel()})
        btn.position = CGPoint(x: 0, y: 160)
        self.addChild(btn)
    }
    
    func levelButton(){
        let label = SKLabelNode(text: "Select Level")
        label.fontName = "Helvetica-Bold"
        
        let background = SKShapeNode(rectOf: CGSize(width: label.fontSize * CGFloat(label.text!.count), height: label.fontSize * 2), cornerRadius: 10)
        background.lineWidth = 5
        
        
        let btn = NodeButton(image: background, label: label, action: {self.loadLevelSelector()})
        btn.position = CGPoint(x: 0, y: -160)
        self.addChild(btn)
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
    
    func loadLevelSelector()
    {
        self.actionsDelegate?.loadLevelSelector()
    }
}
