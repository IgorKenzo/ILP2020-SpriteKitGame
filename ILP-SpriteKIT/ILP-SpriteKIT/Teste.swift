//
//  Teste.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 02/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

class Teste : SKScene {
    
    private var player : SKShapeNode!//SKSpriteNode!
    
    override func didMove(to view: SKView) {
       for node in self.children {
           if (node.name == "TileMap") {
               if let mapNode = node as? SKTileMapNode {
                   giveTileMapPhysicsBody(map: mapNode)
                   mapNode.removeFromParent()
               }
               
           }
       }
        player = SKShapeNode(circleOfRadius: 50)
        player.fillColor = .blue
        player.position = CGPoint(x: 0, y: 0)
        player.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        player.physicsBody!.isDynamic = true
        player.physicsBody!.affectedByGravity = true
        self.addChild(player)
        player.zPosition = 1
//        player.physicsBody?.categoryBitMask = CategoryBitMasks.player
//        player.physicsBody?.contactTestBitMask =  CategoryBitMasks.spike
    }
    
//    //call this by passing in your SKTileMapNode, then you should delete the original SKTileMapNode
        func giveTileMapPhysicsBody(map: SKTileMapNode)
        {

            let tileMap = map
            let startingLocation:CGPoint = tileMap.position

            let tileSize = tileMap.tileSize

            let halfWidth = CGFloat(tileMap.numberOfColumns) / 2.0 * tileSize.width
            let halfHeight = CGFloat(tileMap.numberOfRows) / 2.0 * tileSize.height

            for col in 0..<tileMap.numberOfColumns {

                for row in 0..<tileMap.numberOfRows {

                    if let tileDefinition = tileMap.tileDefinition(atColumn: col, row: row)

                    {

                        let tileArray = tileDefinition.textures
                        let tileTexture = tileArray[0]
                        
                        let x = CGFloat(col) * tileSize.width - halfWidth + (tileSize.width / 2)
                        let y = CGFloat(row) * tileSize.height - halfHeight + (tileSize.height / 2)


                        let tileNode = SKSpriteNode(texture: tileTexture)

                        tileNode.position = CGPoint(x: x, y: y)
                        tileNode.physicsBody = SKPhysicsBody(texture: tileNode.texture!, size: CGSize(width: (tileTexture.size().width ), height: (tileTexture.size().height )))
                        tileNode.physicsBody?.linearDamping = 60.0
                        tileNode.physicsBody?.affectedByGravity = false
                        tileNode.physicsBody?.allowsRotation = false
                        tileNode.physicsBody?.isDynamic = false
                        tileNode.physicsBody?.friction = 1
                        self.addChild(tileNode)

                        tileNode.position = CGPoint(x: tileNode.position.x + startingLocation.x, y: tileNode.position.y + startingLocation.y)

                    }
                }
            }
    
    }
    
}
    
