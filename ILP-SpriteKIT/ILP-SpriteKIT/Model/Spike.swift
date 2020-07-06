//
//  Spike.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 01/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit
import Foundation

class Spike: SKSpriteNode {
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.categoryBitMask = CategoryBitMasks.spike.rawValue
        self.physicsBody?.collisionBitMask = CategoryBitMasks.player.rawValue
        self.lightingBitMask = 1
        self.zPosition = 2
        
        let spin = SKAction.rotate(byAngle: .pi/4, duration: 1)
        self.run(SKAction.repeatForever(spin))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
