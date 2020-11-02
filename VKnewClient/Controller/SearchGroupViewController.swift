//
//  SearchGroupViewController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 18.10.2020.
//

import UIKit

class SearchGroupViewController: UITableViewController {

    let serchgroups: [String] = [
        "IKEA",
        "BMW",
        "Zuegg",
        "Nature",
        "Apple",
        "Art",
        "Life"
    ]
    
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
    }
        
    
    // MARK: - Table view

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return serchgroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell1", for: indexPath) as! GroupsCell
        let group = serchgroups[indexPath.row]
        cell.groupsTitleLabel.text = group
        
        return cell
    }
    
}
