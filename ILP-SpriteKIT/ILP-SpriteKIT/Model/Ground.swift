//
//  Ground.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 29/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//
import SpriteKit
import Foundation

class Ground: SKSpriteNode {
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.affectedByGravity = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
