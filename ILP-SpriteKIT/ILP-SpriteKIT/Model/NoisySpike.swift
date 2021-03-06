//
//  NoisySpike.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 01/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

class NoisySpike : Spike {
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        let light = SKLightNode()
        light.position = CGPoint(x: 0, y: 0)
        light.falloff = 4
        light.ambientColor  = .black
        light.lightColor = .red
        
        self.addChild(light)
        
        let spin = SKAction.rotate(byAngle: .pi/4, duration: 1)
        self.run(SKAction.repeatForever(spin))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
