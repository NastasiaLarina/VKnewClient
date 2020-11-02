//
//  FreindsViewController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 18.10.2020.
//

import UIKit



class FreindsViewController: UITableViewController {

    let freinds: [String] = [
        "Bart Simpson",
        "Lisa Simpson",
        "March Simpson",
        "Gomer Simpson",
        "Maggie Simpson",
        "Bernard Gambl",
        "Geremi Fridman"
        
    ]
    
    var freindsfoto = [
        "bart.gpg",
        "lozafoto1.png",
        "march.png",
        "gomer.png",
        "maggi.png",
        "bernar.png",
        "Jeremi.png"
        ]
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view методы делегата

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return freinds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FreindsCell1", for: indexPath) as! FreindsCell
        let freind = freinds[indexPath.row]
        
        cell.freindsTitleLabel.text = freind
       
        cell.thumbnailImageView.image = UIImage(named: freindsfoto[indexPath.row])
        
        cell.thumbnailImageView.layer.cornerRadius = 30.0
        cell.thumbnailImageView.clipsToBounds = true

        return cell
    }
    
}



