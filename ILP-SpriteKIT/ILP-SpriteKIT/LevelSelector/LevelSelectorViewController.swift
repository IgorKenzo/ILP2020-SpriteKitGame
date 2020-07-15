//
//  LevelSelectorViewController.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 13/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import UIKit

class LevelSelectorViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LevelDefinitions.shared.levels.count
     }
     
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for:    indexPath) as! CustomCell
        //print(indexPath.row)
        cell.defineCell(value: "\(indexPath.row + 1)")
        
        return cell
     }
    
}
