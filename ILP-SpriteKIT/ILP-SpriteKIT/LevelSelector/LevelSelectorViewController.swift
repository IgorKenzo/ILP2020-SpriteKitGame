//
//  LevelSelectorViewController.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 13/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import UIKit

class LevelSelectorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var levelCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        levelCollectionView.delegate = self
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 3
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = levelCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for:    indexPath) as! CustomCell
        
        cell.lblNumber.text = "\(indexPath.row)"
        
        return cell
     }
    
}
