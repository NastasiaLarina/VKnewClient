//
//  FirstViewController+CollectionView.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 11.11.2020.
//

import UIKit

extension GaleryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellIdentifier", for: indexPath) as! CollectionViewCell
        cell.configure(with: DataManager.data[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 6
        selectedCell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        // 7
        selectedCellImageViewSnapshot = selectedCell?.locationImageView.snapshotView(afterScreenUpdates: false)
        
        presentSecondViewController(with: DataManager.data[indexPath.row])
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - Constants.cellSpacing) / 2
        return .init(width: width, height: width)
    }
}
