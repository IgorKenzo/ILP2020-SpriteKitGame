//
//  GameScene.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 19/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreGraphics

enum IsMoving {
    case no
    case right
    case left
}
//MARK: Collision Mask
struct CategoryBitMasks {
    static let player : UInt32  = 0x1 << 0
    static let spike : UInt32   = 0x1 << 1
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var playableRect: CGRect = CGRect()
    
    private var player : SKShapeNode!//SKSpriteNode!
    private var ground : SKSpriteNode!

    private var enemy : SKSpriteNode!
    
    //MARK: Movement
    var lastTouchLocation : CGPoint?
    
    var lastUpdateTime : TimeInterval = 0
    var dt : TimeInterval = 0
    
    let playerSpeedPerSec : CGFloat = 480.0
    var velocity = CGPoint.zero
    
    var eMovement = IsMoving.no
    
    override func didMove(to view: SKView) {
        //playableRect = setPlayableArea(size: self.size)
        self.physicsWorld.contactDelegate = self
        
        enemy = NoisySpike(imageNamed: "spike")
        enemy.size = CGSize(width: 100, height: 100)
        enemy.position = CGPoint(x: -500, y: -320)
        //enemy.name = "enemy"
        self.addChild(enemy)
       
        
        newPlayer()
        setLightEmitter()
        
        
        ground = Ground(color: .white, size: CGSize(width: 200, height: 200))
        ground.position = CGPoint(x: 0, y: 0)
        self.addChild(ground)
        
        let c = Ground(color: .white, size: CGSize(width: 700, height: 30))
        c.position = CGPoint(x: -1 * view.scene!.size.width/2 + (c.size.width/2), y: -1 * view.scene!.size.height/2 + (c.size.height/2))
        self.addChild(c)
        c.zPosition = 2
        //debugPlayableBorder()
    }
    
    func newPlayer(){
        player = SKShapeNode(circleOfRadius: 50)
        player.fillColor = .blue
        player.position = CGPoint(x: 0, y: 300)
        player.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        player.physicsBody!.isDynamic = true
        player.physicsBody!.affectedByGravity = true
        self.addChild(player)
        player.zPosition = 1
        player.physicsBody?.categoryBitMask = CategoryBitMasks.player
        player.physicsBody?.contactTestBitMask =  CategoryBitMasks.spike
    }
    
    func setLightEmitter()
    {
        let light = SKLightNode()
        light.position = CGPoint(x: 0, y: 0)
        light.falloff = 7
        light.ambientColor  = .black
        light.lightColor = .white
        
        player.addChild(light)
    }
    
    func setPlayableArea(size: CGSize) -> CGRect{
          let maxAspectRatio : CGFloat = 16.0/9.0
          let playableHeight = size.height/maxAspectRatio
          let playableMargin = (size.height - playableHeight)/2.0
          return CGRect(x:0 - size.width/2, y: -1 * (playableHeight - playableMargin) ,width: size.width,height: playableHeight)
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
        switch eMovement {
        case .no:
            break
        case .left:
            player.physicsBody?.velocity = CGVector(dx: -200,dy: physicsWorld.gravity.dy)
        case .right:
            player.physicsBody?.velocity = CGVector(dx: 200,dy: physicsWorld.gravity.dy)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch?.location(in: self)
        //Touch in some node
        //let touchedNode = self.atPoint(positionInScene ?? CGPoint.zero)

//        if let name = touchedNode.name
//        {
//            if name == "leftArrow"
//            {
//                eMovement = .left
//            }
//            else if name == "enemy" {
//                eMovement = .right
//            }
//            else {
//                eMovement = .no
//            }
//        }
        
        if positionInScene!.x < 0 {
            eMovement = .left
        }
        else if positionInScene!.x > 0 {
             eMovement = .right
        }
        else {
            eMovement = .no
        }
        

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        eMovement = .no
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision : UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision ==  CategoryBitMasks.player |  CategoryBitMasks.spike {
            let lostText = SKLabelNode(fontNamed: "Arial")
            lostText.text = "You Lost"
            lostText.fontColor = .systemPink
            lostText.fontSize = 200
            lostText.position = CGPoint(x: 0, y: 0)
            self.addChild(lostText)
            lostText.zPosition = 4
              
        }
    }
    
}



////Create shape node to   during mouse interaction
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
