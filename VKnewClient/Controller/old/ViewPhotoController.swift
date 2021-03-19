//
//  ViewPhotoController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 25.10.2020.


import UIKit

class ViewPhotoController: UIViewController {
    
    var currentPhoto: UIImage!
    
    // MARK: - Outlets
    
    @IBOutlet private weak var imageViewPreview: UIImageView!
    
    // MARK: - Actions
    
    
    @IBAction func actionTapped(_ sender: UIImageView) {
        
        
    }
    
    // MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageViewPreview.image = currentPhoto;
        
        
    }
    
}
