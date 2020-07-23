//
//  SpriteLoader.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 23/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

class SpriteLoader {
    static let shared = SpriteLoader(spike: SKTexture(imageNamed: "spike"))
    
    var spike : SKTexture
    
    private init(spike : SKTexture) {
        self.spike = spike
    }
}
