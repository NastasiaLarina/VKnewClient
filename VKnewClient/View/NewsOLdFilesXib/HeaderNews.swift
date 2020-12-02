//
//  HeaderNews.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 05.11.2020.
//

import UIKit

final class HeaderNews: UITableViewCell {

    static let nib = UINib(nibName: "HeaderNews", bundle: nil)
    static let reuseId = "HeaderNews"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var avatarInNews: UIImageView!
    
}
