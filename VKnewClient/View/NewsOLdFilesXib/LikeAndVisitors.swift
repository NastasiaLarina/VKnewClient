//
//  LikeAndVisitors.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 05.11.2020.
//

import UIKit

class LikeAndVisitors: UITableViewCell {

    static let nib = UINib(nibName: "LikeAndVisitors", bundle: nil)
    static let reuseId = "LikeAndVisitors"
  
    // MARK: - Outlets
    
    @IBOutlet weak var likeBtnNews: UIButton!
    @IBOutlet weak var countLikeBtn: UILabel!
    @IBOutlet weak var messegeBtn: UIButton!
    @IBOutlet weak var countMessage: UILabel!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var countShare: UILabel!
    @IBOutlet weak var visitirsBtn: UIButton!
    @IBOutlet weak var countVisitors: UILabel!
}
