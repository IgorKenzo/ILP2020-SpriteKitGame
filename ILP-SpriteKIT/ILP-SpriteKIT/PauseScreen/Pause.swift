//
//  Pause.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 31/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

class Pause: SKScene {


    override func didMove(to view: SKView) {
        setBtnResume()
        setBtnMenu()
        setBtnRestart()
    }

    
    func setBtnResume() {
        let label = SKLabelNode(text: "Resume")
               label.fontName = "Helvetica-Bold"
               
       let background = SKShapeNode(rectOf: CGSize(width: label.fontSize * CGFloat(label.text!.count), height: label.fontSize * 2), cornerRadius: 10)
       background.lineWidth = 5
               
               
        let btn = ButtonNode(image: background, label: label, action: {
            TransitionManager.shared.transition(from: self, to: .GamePlay, transition: .crossFade(withDuration: 0.5))
        })
        btn.position = CGPoint(x: 0, y: 200)
       self.addChild(btn)
    }
    
    func setBtnRestart() {
        let label = SKLabelNode(text: "Restart")
        label.fontName = "Helvetica-Bold"
               
       let background = SKShapeNode(rectOf: CGSize(width: label.fontSize * CGFloat(label.text!.count), height: label.fontSize * 2), cornerRadius: 10)
       background.lineWidth = 5
               
               
       let btn = ButtonNode(image: background, label: label, action: { print("bbbbb") })
        btn.position = CGPoint(x: 0, y: 100)
       self.addChild(btn)
    }
    
    func setBtnMenu() {
        let label = SKLabelNode(text: "MainMenu")
               label.fontName = "Helvetica-Bold"
               
       let background = SKShapeNode(rectOf: CGSize(width: label.fontSize * CGFloat(label.text!.count), height: label.fontSize * 2), cornerRadius: 10)
       background.lineWidth = 5
               
               
       let btn = ButtonNode(image: background, label: label, action: {
        TransitionManager.shared.transition(from: self, to: .MainMenu, transition: .fade(withDuration: 0.5))
       })
        btn.position = CGPoint(x: 0, y: 0)
       self.addChild(btn)
    }

}
