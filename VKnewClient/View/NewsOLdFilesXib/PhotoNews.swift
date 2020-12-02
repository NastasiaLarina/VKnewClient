//
//  PhotoNews.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 05.11.2020.
//

import UIKit

class PhotoNews: UITableViewCell {

    static let nib = UINib(nibName: "PhotoNews", bundle: nil)
    static let reuseId = "PhotoNews"

    @IBOutlet weak var photoNews: UIImageView!
    
}
