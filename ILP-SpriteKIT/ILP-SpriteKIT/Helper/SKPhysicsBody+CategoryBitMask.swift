//
//  SKPhysicsBody+CategoryBitMask.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 07/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

extension SKPhysicsBody {
    var category: CategoryBitMasks {
        get {
            return CategoryBitMasks(rawValue: self.categoryBitMask)
        }
        set(newValue) {
            self.categoryBitMask = newValue.rawValue
        }
    }
}
