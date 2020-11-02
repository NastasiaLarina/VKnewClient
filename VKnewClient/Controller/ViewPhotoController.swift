//
//  ViewPhotoController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 25.10.2020.
//

import UIKit

class ViewPhotoController: UIViewController {

    var currentPhoto: UIImage!
    
    @IBOutlet private weak var imageViewPreview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageViewPreview.image = currentPhoto;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
