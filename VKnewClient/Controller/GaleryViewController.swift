//
//  FirstViewController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 11.11.2020.
//

import UIKit

class GaleryViewController: UIViewController {
    
    var photos: [String] = []
    
    // 5
    var selectedCell: CollectionViewCell?
    var selectedCellImageViewSnapshot: UIView?
    
    @IBOutlet private var collectionView: UICollectionView!
    
    // 15
    var animator: Animator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constants.cellSpacing
        layout.minimumInteritemSpacing = Constants.cellSpacing
        
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    // Mark: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let controller = segue.destination as? PhotoViewController,
            let indexPath = collectionView.indexPathsForSelectedItems?.first
        else { return }
        

        controller.photo = photos
        controller.title = title
        controller.currentIndex = indexPath.row
       
    }
    
    
    
    func presentSecondViewController(with data: CellData) {
        let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! PhotoViewController
        
        // 4
        secondViewController.transitioningDelegate = self
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.data = data
        present(secondViewController, animated: true)
    }
}

extension GaleryViewController {
    
    enum Constants {
        
        static let cellSpacing: CGFloat = 8
    }
}
