//
//  LevelSelectorViewController.swift
//  ILP-SpriteKIT
//
//  Created by Igor Kenzo Miyamoto Dias on 13/07/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import UIKit

class LevelSelectorViewController: UICollectionViewController {

    let dataSource = ["aaaaaaa","aaaaaaa","aaaaaaa"]
    
    override func viewDidLoad() {
        //levelCollectionView.delegate = self
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
     }
     
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for:    indexPath) as! CustomCell
        //print(indexPath.row)
        cell.lblNumber.text = dataSource[indexPath.row]
        
        return cell
     }
    
}
