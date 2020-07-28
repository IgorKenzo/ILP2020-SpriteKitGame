//
//  TransitionManager.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 28/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SpriteKit

class TransitionManager {
    
    enum SceneType {
        case MainMenu
        case GamePlay
    }
    
    private init() {}
    
    static let shared = TransitionManager()
    var mainmenu : SKScene?
    
    
    
    func getScene(_ sceneType: SceneType) -> SKScene? {
        switch sceneType {
        case .MainMenu:
            return self.mainmenu
        case .GamePlay:
            return SKScene(fileNamed: "PhasesScene")
        }
    }
    
    
    func transition(from: SKScene, to: SceneType){
        guard let scene = getScene(to) else { return }
        
        scene.scaleMode = .aspectFill
        
        from.view?.presentScene(scene)
    }
}
