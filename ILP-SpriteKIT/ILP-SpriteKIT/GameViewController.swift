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
    func loadContinueLevel()
    func loadLevelSelector()
    func selectLevel(levelIndex: Int)
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
        self.performSegue(withIdentifier: "LevelSelectorSegue", sender: self)
    }
    
    func loadContinueLevel(){
        guard let view = self.view as? SKView else {
            return
        }

        guard let scene = GameScene(fileNamed: "PhasesScene") else {
            return
        }

        scene.scaleMode = .aspectFill

        //view.showsPhysics = true
        view.showsDrawCount = true
        view.showsFPS = true

        view.presentScene(scene, transition: .push(with: .left, duration: 1))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let l = segue.destination as? LevelSelectorViewController{
            l.actionsDelegate = self
        }
    }
    
    func selectLevel(levelIndex : Int){
        State.levelState = LevelState(rawValue: levelIndex)!
        
        navigationController?.popToRootViewController(animated: false)
        
        guard let view = self.view as? SKView else {
            return
        }

        guard let scene = GameScene(fileNamed: "PhasesScene") else {
            return
        }

        scene.scaleMode = .aspectFill

        //view.showsPhysics = true
        view.showsDrawCount = true
        view.showsFPS = true

        view.presentScene(scene, transition: .push(with: .left, duration: 1))
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
