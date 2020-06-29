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

class GameScene: SKScene {
    
    private var playableRect: CGRect = CGRect()
    
    private var player : SKSpriteNode!
    private var ground : SKSpriteNode!
    
    private var leftArrow : SKSpriteNode!
    private var rightArrow : SKSpriteNode!
    
    //MARK: Movement
    var lastTouchLocation : CGPoint?
    
    var lastUpdateTime : TimeInterval = 0
    var dt : TimeInterval = 0
    
    let playerSpeedPerSec : CGFloat = 480.0
    var velocity = CGPoint.zero
    
    var eMovement = IsMoving.no
    
    //MARK: Gravity
    let gravityMultiplier : CGFloat = 20
    
    override func didMove(to view: SKView) {
        //playableRect = setPlayableArea(size: self.size)
        
        leftArrow = SKSpriteNode(color: .yellow, size: CGSize(width: 100, height: 100))
        leftArrow.position = CGPoint(x: -1100, y: -320)
        leftArrow.name = "leftArrow"
        self.addChild(leftArrow)
        
        rightArrow = SKSpriteNode(color: .blue, size: CGSize(width: 100, height: 100))
        rightArrow.position = CGPoint(x: -950, y: -320)
        rightArrow.name = "rightArrow"
        self.addChild(rightArrow)
        
        player = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        player.position = CGPoint(x: 0, y: 300)
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        player.physicsBody!.isDynamic = true
        player.physicsBody!.affectedByGravity = true
        player.physicsBody!.mass = 100
        self.addChild(player)
        player.zPosition = 1
        
        ground = Ground(color: .white, size: CGSize(width: 200, height: 200))
        ground.position = CGPoint(x: 0, y: 0)
        self.addChild(ground)
        ground.zPosition = 2
        
        let c = Ground(color: .white, size: CGSize(width: 700, height: 30))
        c.position = CGPoint(x: -1 * view.scene!.size.width/2 + (c.size.width/2), y: -1 * view.scene!.size.height/2 + (c.size.height/2))
        self.addChild(c)
        c.zPosition = 2
        //debugPlayableBorder()
    }
    
    
//    func pointModule(point: CGPoint) -> CGFloat{
//        return CGFloat(sqrt(Double(pow(point.x, 2) + pow(point.y, 2))))
//    }
    
//    func moveSprite(sprite: SKSpriteNode, velocity: CGPoint){
//        let movement  = CGPoint(x: velocity.x * CGFloat(dt), y: velocity.y * CGFloat(dt))
//        sprite.position = CGPoint(x: sprite.position.x + movement.x, y: sprite.position.x + movement.y)
//    }
    
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
            player.physicsBody?.velocity = CGVector(dx: -200,dy: physicsWorld.gravity.dy * gravityMultiplier)
        case .right:
            player.physicsBody?.velocity = CGVector(dx: 200,dy: physicsWorld.gravity.dy * gravityMultiplier)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let positionInScene = touch?.location(in: self)
        let touchedNode = self.atPoint(positionInScene ?? CGPoint.zero)

        if let name = touchedNode.name
        {
            if name == "leftArrow"
            {
                eMovement = .left
            }
            else if name == "rightArrow" {
                eMovement = .right
            }
            else {
                eMovement = .no
            }
        }

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        eMovement = .no
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
