//
//  CategoryBitMak.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 07/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import Foundation

struct CategoryBitMasks : OptionSet {
    let rawValue: UInt32
    init(rawValue: UInt32) { self.rawValue = rawValue }
    
    static let player = CategoryBitMasks(rawValue: 0x1 << 0)
    static let spike  = CategoryBitMasks(rawValue: 0x1 << 1)
    static let finish = CategoryBitMasks(rawValue: 0x1 << 2)
}
