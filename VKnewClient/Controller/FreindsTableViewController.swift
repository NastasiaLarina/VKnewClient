//
//  FreindsTableViewController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 24.10.2020.
//

import UIKit

class FreindsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LetterPickerDelegate {
    
    
    let items: [User] = User.randomMany.sorted { $0.name.lowercased() < $1.name.lowercased()
    }
    
    let searchController = UISearchController(searchResultsController: nil
    )
    
    var filtreditems = [String]()
    
   // var freindSectionTitles = [String]()
   // var freindDict = [String: [String]]()
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var letterPicker: LetterPicker!
    
    // Mark: - Life cycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setap the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        tableView.register(UINib(nibName: "HeaderForAllGroup", bundle: nil),  forHeaderFooterViewReuseIdentifier: "HeaderForAllGroup")
        
        letterPicker.delegate = self
        let allLetters = items.map {String($0.name.uppercased().prefix(1)) }
        letterPicker.letters = Array(Set(allLetters)).sorted()
    }
    // Mark: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
        let controller = segue.destination as? PhotosViewController,
        let indexPath = tableView.indexPathForSelectedRow
        else { return }
        
        let item = items[indexPath.row]
        controller.photos = item.photos
        controller.title = item.name
    }
    
    //Mark: - Table View
    
    //название секции
   /* func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
    }
    
    //количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }//количество строк секции
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FreindCell //Fc -т к у нас кастомная ячейка
        let item = items[indexPath.row]
        
        cell.avatarView.image = UIImage(named: "Avatars/\(item.avatar)")
        cell.nameLabel.text = item.name
        
        return cell
    }//формирование самой ячейки
    
    
    // Mark: - LetterPickerDelegate
    
    func letterPicked(_ letter: String) {
        guard let index = items
                .firstIndex(where: { $0.name.lowercased().prefix(1) == letter.lowercased() }) else { return }
        let indexPath = IndexPath(row: index, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
   /* func createFreindDict(){
        for item in items {
            let itemKey = item.substingToIndex(item.startIndex.advanceBy(1))
            if var itemValues = freindDict[itemKey] {
                itemValues.append(item)
                freindDict[itemKey] = itemValues
            }
        }
    }
    */
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderForAllGroup") as? HeaderForAllGroup else { return nil }
        return headerView
        
    }
}

extension FreindsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(#function)
    }
    
    
}
