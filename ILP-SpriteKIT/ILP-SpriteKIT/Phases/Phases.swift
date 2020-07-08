//
//  Phases.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 07/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreGraphics


class Phases: SKScene, SKPhysicsContactDelegate {
    
    private var playableRect: CGRect = CGRect()
    
    private var player : SKShapeNode!//SKSpriteNode!

    private var goal : SKShapeNode!
    
    private let levelDefinition = LevelDefinitions()
    
    private var levelState = LevelState.lvl1
    
    private var gameState = GameState.pause
    
    //MARK: Movement
    let playerSpeedPerSec : CGFloat = 480.0
    
    var eMovement = IsMoving.no
    
    override func didMove(to view: SKView) {
        //playableRect = setPlayableArea(size: self.size)
        self.physicsWorld.contactDelegate = self
        
//        enemy = NoisySpike(imageNamed: "spike")
//        enemy.size = CGSize(width: 100, height: 100)
//        enemy.position = CGPoint(x: -500, y: -320)
//        self.addChild(enemy)
        
        newPlayer()
        setLightEmitter()
        goal = FinishGoal.new()
        
        setPositions()
    }
    
    func setPositions() {
        print(levelState.rawValue)
        
        for g in levelDefinition.levels[levelState.rawValue].grounds {
            g.0.position = g.1
            self.addChild(g.0)
        }
        
        for s in levelDefinition.levels[levelState.rawValue].spikes {
            s.0.position = s.1
            self.addChild(s.0)
        }
        
        
        player.position = levelDefinition.levels[levelState.rawValue].playerSpawn
        player.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        self.addChild(player)
        goal.position = levelDefinition.levels[levelState.rawValue].safePoint
        self.addChild(goal)
        
        gameState = GameState.playing
    }
    
    
    func newPlayer(){
        player = SKShapeNode(circleOfRadius: 50)
        player.fillColor = .blue
        player.position = CGPoint(x: 0, y: 300)
        player.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        player.physicsBody!.isDynamic = true
        player.physicsBody!.affectedByGravity = true
        player.zPosition = 1
        player.physicsBody?.categoryBitMask = CategoryBitMasks.player.rawValue
        player.physicsBody?.contactTestBitMask =  CategoryBitMasks.spike.rawValue
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
        
        let categoryMasks : CategoryBitMasks = [contact.bodyA.category, contact.bodyB.category]
        
        if (categoryMasks.contains([.player,.spike]) && gameState != GameState.lose) {
            if collision ==  CategoryBitMasks.player.rawValue |  CategoryBitMasks.spike.rawValue {
                
                gameState = GameState.lose
                
                removeNodes()
                self.setPositions()
                
            }
        }
        
        else if (categoryMasks.contains([.player,.finish]) && gameState != GameState.lose){
            if collision == CategoryBitMasks.finish.rawValue | CategoryBitMasks.player.rawValue  {
                
                gameState = GameState.lose
                
                removeNodes()
                self.levelState = LevelState(rawValue: self.levelState.rawValue + 1)!
                self.setPositions()
                
            }
        }
    }
    
    func removeNodes() {
        player.removeFromParent()
        goal.removeFromParent()
        
        for g in levelDefinition.levels[levelState.rawValue].grounds {
            g.0.removeFromParent()
        }
    }
}
