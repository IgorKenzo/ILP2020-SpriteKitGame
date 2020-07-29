//
//  Pause.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 28/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

class PauseDialog: SKShapeNode {
    var status : Int = 0
//    var btnResume : ButtonNode?
//    var btnRestart : ButtonNode?
//    var btnMenu : ButtonNode?
    var dismiss : (() -> Void)?
    
    override init() {
        super.init()
        setBtnResume()
        setBtnRestart()
        setBtnMenu()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBtnResume() {
        let label = SKLabelNode(text: "Resume")
               label.fontName = "Helvetica-Bold"
               
       let background = SKShapeNode(rectOf: CGSize(width: label.fontSize * CGFloat(label.text!.count), height: label.fontSize * 2), cornerRadius: 10)
       background.lineWidth = 5
               
               
        let btn = ButtonNode(image: background, label: label, action: {
            self.status = 1
            
            self.dismiss!()
        })
        btn.position = CGPoint(x: 0, y: 200)
       self.addChild(btn)
    }
    
    func setBtnRestart() {
        let label = SKLabelNode(text: "Restart")
        label.fontName = "Helvetica-Bold"
               
       let background = SKShapeNode(rectOf: CGSize(width: label.fontSize * CGFloat(label.text!.count), height: label.fontSize * 2), cornerRadius: 10)
       background.lineWidth = 5
               
               
       let btn = ButtonNode(image: background, label: label, action: { self.status = 2 })
        btn.position = CGPoint(x: 0, y: 100)
       self.addChild(btn)
    }
    
    func setBtnMenu() {
        let label = SKLabelNode(text: "MainMenu")
               label.fontName = "Helvetica-Bold"
               
       let background = SKShapeNode(rectOf: CGSize(width: label.fontSize * CGFloat(label.text!.count), height: label.fontSize * 2), cornerRadius: 10)
       background.lineWidth = 5
               
               
       let btn = ButtonNode(image: background, label: label, action: { self.status = 3 })
        btn.position = CGPoint(x: 0, y: 0)
       self.addChild(btn)
    }
    
    func ds(){
        
    }
}
