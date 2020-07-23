//
//  FinishGoal.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 07/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

class FinishGoal{
    static func new() -> SKShapeNode
    {
        let path = CGMutablePath()
        path.addLine(to: CGPoint(x: 200, y: 200))
        path.addArc(center: CGPoint(x: 0, y: 0), radius: CGFloat(50), startAngle: 0, endAngle: .pi, clockwise: false)
        let goal = SKShapeNode(path: path)
        goal.position = CGPoint(x: -590, y: -1230)
        goal.fillColor = .yellow

//        let light = SKLightNode()
//        light.position = CGPoint(x: 0, y: 0)
//        light.falloff = 3
//        light.ambientColor  = .black
//        light.lightColor = .yellow
//              
//        goal.addChild(light)

        goal.physicsBody = SKPhysicsBody(edgeLoopFrom: path)
        goal.physicsBody?.affectedByGravity = false
        goal.physicsBody?.isDynamic = false
        goal.physicsBody?.contactTestBitMask = CategoryBitMasks.player.rawValue
        goal.physicsBody?.categoryBitMask = CategoryBitMasks.finish.rawValue
        goal.physicsBody?.category = CategoryBitMasks.finish
        
        return goal
    }
}
