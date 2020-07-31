//
//  GameState.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 08/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import Foundation

enum GameState {
    case playing
    case pause
    case win
    case lose
    case menu
    
}

let MAXLEVEL = LevelDefinitions.shared.levels.count

enum LevelState : Int {
    case none = -1
    case lvl1 = 0
    case lvl2
    case lvl3
    case lvl4
    case lvl5
    case lvl6
    case lvl7
}

class State {
    
    private init() {}
    static var shared : State = State()
    
    var gameState = GameState.menu
    var levelState = LevelState.none
    var lastLevelPlayed = LevelState.none
}
