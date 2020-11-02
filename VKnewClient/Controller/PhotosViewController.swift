//
//  PhotosViewController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 24.10.2020.
//

import UIKit

class PhotosViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var photos: [String] = []
    
    //Mark: - Life cycles
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private enum Constants {
        static let padding: CGFloat = 5 // задаем отступы которые можем многократно использовать в проекте
        static let columns: CGFloat = 2 // количество колонок
    }
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotoCell
        
        let photo = photos[indexPath.row]
        cell.photoImageView.image = UIImage(named: "Photo/\(photo)")
         
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goPhoto"
        {
            let cell: PhotoCell = sender as! PhotoCell
            
            let image = cell.photoImageView.image
            
            let viewPhotoController: ViewPhotoController = segue.destination as! ViewPhotoController
            viewPhotoController.currentPhoto = image
            
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - Constants.padding) / Constants.columns
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.padding
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.padding
    }
}
