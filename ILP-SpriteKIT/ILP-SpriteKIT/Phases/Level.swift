//
//  Level.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 06/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

class Level {
    var grounds : [Ground]
    var playerSpawn : CGPoint
    var safePoint : CGPoint
    
    init(grounds : [Ground], playerSpawn : CGPoint, safePoint : CGPoint) {
        self.grounds = grounds
        self.playerSpawn = playerSpawn
        self.safePoint = safePoint
    }
}
