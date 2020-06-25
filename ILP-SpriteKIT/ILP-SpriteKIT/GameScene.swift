//
//  GameScene.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 19/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var playableRect: CGRect = CGRect()
    
    private var player : SKSpriteNode!
    private var ground : SKSpriteNode!
    
   
    
    override func didMove(to view: SKView) {
        playableRect = setPlayableArea(size: self.size)
        
        player = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        player.position = CGPoint(x: 0, y: 300)
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        player.physicsBody?.isDynamic = true
        player.physicsBody?.affectedByGravity = true
        self.addChild(player)
        player.zPosition = 1
        
        
        ground = SKSpriteNode(color: .white, size: CGSize(width: 200, height: 200))
        ground.position = CGPoint(x: 0, y: 0)
        ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 200))
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.affectedByGravity = false
        self.addChild(ground)
        ground.zPosition = 2
        
        //debugPlayableBorder()
    }
    
    func setPlayableArea(size: CGSize) -> CGRect{
          let maxAspectRatio : CGFloat = 16.0/9.0
          let playableHeight = size.height/maxAspectRatio
          let playableMargin = (size.height - playableHeight)/2.0
          print(playableMargin)
          return CGRect(x:0 - size.width/2, y: playableMargin - playableHeight,width: size.width,height: playableHeight)
      }
    
    
    func debugPlayableBorder(){
        
        let path = CGMutablePath()
        path.addRect(playableRect)
        let shape = SKShapeNode(path: path)
        shape.path = path
        shape.strokeColor = .systemRed
        shape.lineWidth = 4.0
        addChild(shape)
    }
  
//
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
}



//// Create shape node to use during mouse interaction
//let w = (self.size.width + self.size.height) * 0.05
//self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//
//if let spinnyNode = self.spinnyNode {
//    spinnyNode.lineWidth = 2.5
//
//    spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//    spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                      SKAction.fadeOut(withDuration: 0.5),
//                                      SKAction.removeFromParent()]))
//}



//func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
//    }
//
//    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
//    }
//
//    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
