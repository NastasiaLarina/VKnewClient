//
//  AllGroupsViewController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 18.10.2020.
//

import UIKit

class AllGroupsViewController: UITableViewController {

    let allGroups: [String] = [
        "AUDI group",
        "BMW lovers",
        "Lufthansa",
        "S7 Airlines",
        "TOUS Jewelry",
        "AEROFLOT",
        "Tiffany & Co",
        "IKEA",
        "IOS dev",
        "APPLE"
    ]
    
    var groupFoto = [
        "1.png",
        "2.png",
        "3.png",
        "4.png",
        "5.png",
        "6.png",
        "7.png",
        "8.png",
        "9.png",
        "10.png"
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "HeaderForAllGroup", bundle: nil),  forHeaderFooterViewReuseIdentifier: "HeaderForAllGroup")
        
    }

    // MARK: - Table view 

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Group", for: indexPath) as! GroupCell
        let allGroup = allGroups[indexPath.row]
        cell.labelName.text = allGroup
        
        cell.groupView.image = UIImage(named: groupFoto[indexPath.row])
        
        //cell.groupView.layer.cornerRadius = 35.0
        //cell.groupView.clipsToBounds = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderForAllGroup") as? HeaderForAllGroup else { return nil }
        return headerView
        
    }
}
