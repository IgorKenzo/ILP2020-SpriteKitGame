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
    
    private var player : SKSpriteNode!//SKShapeNode!//

    private var goal : SKShapeNode!
    
    private let levelDefinition = LevelDefinitions.shared
    
    private var levelState = State.levelState
    
    private var gameState = GameState.menu
    
    private var revealShader : SKSpriteNode?
    
    private var pickupNode : SKSpriteNode!
    
    //MARK: Movement
    let playerSpeedPerSec : CGFloat = 300.0
    
    var eMovement = IsMoving.no
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        
        let pause = ButtonNode(image: SKShapeNode(circleOfRadius: 20), label: SKLabelNode(text: "ä")) {
            //self.view?.isPaused = !self.view!.isPaused
            
            let width : CGFloat = 1000, height : CGFloat = 1000
            let sc = PauseDialog(rect: CGRect(x: -(width/2), y: -(height/2), width: width, height: height), cornerRadius: 10)
            sc.dismiss = { sc.removeFromParent() }
            self.addChild(sc)
            
        }
        
        pause.position = CGPoint(x: 0, y: 0)
        self.addChild(pause)
        
        newPlayer()
        setLightEmitter()
        goal = FinishGoal.new()
        newPickup()
        
        let teste = SKShader(fileNamed: "shader.fsh")
        teste.uniforms = [SKUniform(name: "u_resolution", vectorFloat2: (SIMD2<Float>(repeating: 500)))]

        revealShader = SKSpriteNode()
        revealShader!.size = CGSize(width: 500, height: 500)
        revealShader!.shader = teste
        revealShader!.position = CGPoint(x: 0, y: 0)
        revealShader!.zPosition = -3
        
//        
        
        if State.levelState == .none {levelState = LevelState(rawValue: 0)!}
        else if State.lastLevelPlayed != .none {
            levelState = State.lastLevelPlayed
        }

        setPositions()
    }
    
    func setPositions() {
        
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
        
        if let pos = levelDefinition.levels[levelState.rawValue].pickupPoint {
            pickupNode.position = pos
            self.addChild(pickupNode)
        }
        
        gameState = GameState.playing
    }
    func newPickup()
    {
        pickupNode = SKSpriteNode(imageNamed: "circleshader")
        pickupNode.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        pickupNode.physicsBody?.affectedByGravity = false
        pickupNode.physicsBody?.isDynamic = false
        pickupNode.physicsBody?.categoryBitMask = CategoryBitMasks.pickup.rawValue
        pickupNode.physicsBody?.category = CategoryBitMasks.pickup
        pickupNode.physicsBody?.contactTestBitMask = CategoryBitMasks.player.rawValue
    }
    
    func newPlayer(){
        player = SKSpriteNode(imageNamed: "player")
        player.position = CGPoint(x: 0, y: 300)
        player.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        player.physicsBody!.isDynamic = true
        player.physicsBody!.affectedByGravity = true
        player.zPosition = 1
        player.physicsBody?.categoryBitMask = CategoryBitMasks.player.rawValue
        player.physicsBody?.contactTestBitMask = CategoryBitMasks.spike.rawValue
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
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        switch eMovement {
        case .no:
            break
        case .left:
            player.physicsBody?.velocity = CGVector(dx: -(playerSpeedPerSec),dy: physicsWorld.gravity.dy)
        case .right:
            player.physicsBody?.velocity = CGVector(dx: playerSpeedPerSec,dy: physicsWorld.gravity.dy)
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
                
                gameState = GameState.win
                
                removeNodes()
                let sound = SKAction.playSoundFileNamed("nice.m4a", waitForCompletion: false)
                self.run(sound)
                State.lastLevelPlayed = LevelState(rawValue: self.levelState.rawValue)!
                self.levelState = LevelState(rawValue: self.levelState.rawValue + 1)!
                if levelState.rawValue < MAXLEVEL {
                    self.setPositions()
                }
                else {
                    print("end")
                }
            }
        }
        else if (categoryMasks.contains([.player,.pickup]) && gameState != GameState.lose){
            pickupNode.removeFromParent()
            self.addChild(revealShader!)
            
           revealShader?.run(SKAction.scale(by: 3, duration: 1))
        }
    }
    
    func removeNodes() {
        player.removeFromParent()
        goal.removeFromParent()
        
        pickupNode.removeFromParent()
        revealShader?.removeFromParent()
        
        for g in levelDefinition.levels[levelState.rawValue].grounds {
            g.0.removeFromParent()
        }
        
        for s in levelDefinition.levels[levelState.rawValue].spikes {
            s.0.removeFromParent()
        }
    }
}
