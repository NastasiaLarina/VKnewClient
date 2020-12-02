//
//  NewsText.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 05.11.2020.
//

import UIKit

class NewsText: UITableViewCell {

    static let nib = UINib(nibName: "NewsText", bundle: nil)
    static let reuseId = "NewsText"
    
    @IBOutlet weak var textNews: UITextView!
    
    
}
