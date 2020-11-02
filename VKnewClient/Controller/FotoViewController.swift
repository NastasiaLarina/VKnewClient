//
//  FotoViewController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 18.10.2020.
//

import UIKit

private let reuseIdentifier = "Cell"

class FotoViewController: UICollectionViewController {

    var fotoCollecton = [
        "bart.gpg",
        "lozafoto1.png",
        "march.png",
        "gomer.png",
        "maggi.png",
        "bernar.png",
        "Jeremi.png"
        ]
    
    
    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FotoCell
        
        return cell
    }

    

}
