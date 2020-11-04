//
//  NewsViewController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 29.10.2020.
//

import UIKit

class NewsViewController: UITableViewController, UISearchBarDelegate {

    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Mark: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // MARK: - Table view
        
        tableView.register(UINib(nibName: "NewsCell", bundle: nil),  forHeaderFooterViewReuseIdentifier: "NewsCell")
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(#function)
    }
}
