//
//  GameViewController.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 19/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

protocol ActionsDelegate {
   func loadLevelSelector()
}


class GameViewController: UIViewController, SKSceneDelegate, ActionsDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
//            if let scene = GameScene(fileNamed: "SceneTeste") {
//                // Set the scale mode to scale to fit the window
//                scene.scaleMode = .aspectFill
//                // Present the scene
//                view.presentScene(scene)
//            }
            
            
            let scene = SKScene(fileNamed: "MainMenuScene") as! MainMenu
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            scene.actionsDelegate = self
            // Present the scene
            view.presentScene(scene)
            
            
            //let scene = SKScene(size: CGSize(width: 2688, height: 1242))
            //view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsPhysics = true
            view.showsFPS = true
            view.showsNodeCount = true
            
           
        }
    }
    
    func loadLevelSelector()
    {
//        let level = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LevelSelectorViewController")
//
//        self.present(level, animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "LevelSelectorSegue", sender: self)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
 
}
