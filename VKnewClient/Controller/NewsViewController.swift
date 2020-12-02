//
//  NewsViewController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 29.10.2020.
//

import UIKit

class NewsViewController: UITableViewController, UISearchBarDelegate {
    
    let news = NewsItem.fake
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchView: SearchView!
    

        
    // MARK: -
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return news.count
        }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsViewCell
        cell.configure(item: news[indexPath.row])
        return cell
        }
        
    }

