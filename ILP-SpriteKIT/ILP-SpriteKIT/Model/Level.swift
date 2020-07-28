//
//  Level.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 06/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

class Level {
    //Tuple of Ground and Position 
    var grounds : [(Ground, CGPoint)]
    var spikes :  [(Spike, CGPoint)]
    var playerSpawn : CGPoint
    var safePoint : CGPoint
    var pickupPoint : CGPoint?
    
    init(grounds : [(Ground, CGPoint)],spikes: [(Spike, CGPoint)], playerSpawn : CGPoint, safePoint : CGPoint, pickupPoint: CGPoint?) {
        self.grounds = grounds
        self.spikes = spikes
        self.playerSpawn = playerSpawn
        self.safePoint = safePoint
        self.pickupPoint = pickupPoint
    }
}
