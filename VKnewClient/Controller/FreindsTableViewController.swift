//
//  FreindsTableViewController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 24.10.2020.
//

import UIKit

class FreindsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LetterPickerDelegate, UISearchBarDelegate {
    
    var photos: [String] = []
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var letterPicker: LetterPicker!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Data Sourse
    
    var sections: [String] = [] // массив букв
    var allItems: [User] = [] // массив всех друзей
    var filtredItems: [User] = []
    var cachedSectionItems: [String: [User]] = [:]
    
    // массив возвращает всех друзей для секции с определенным индексом
    func getItems(for section: Int) -> [User]{
        let sectionLetter = sections[section]
        
        if let sectionItems = cachedSectionItems[sectionLetter] {
            return sectionItems
        }
        let sectionItems = filtredItems.filter {
            $0.lastName.uppercased().prefix(1) == sectionLetter
        }
        cachedSectionItems[sectionLetter] = sectionItems
        return sectionItems
    }
    
    // получаем конкретного друга для индекспути
    func getItems(for indexPath: IndexPath) -> User {
        return getItems(for: indexPath.section)[indexPath.row]
    }
    
    // фильтруем друзей в зависимости от контекста
    func filterItems(text: String?) {
        guard let text = text, !text.isEmpty else {
            filtredItems = allItems
            return
        }
        
        filtredItems = allItems.filter {
            $0.fullName.lowercased().contains(text.lowercased())
        }
    }
    
    // Mark: - Life cycle
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAllItems()
        reloadDataSource()
        setupViews()
        
    }
    
    // MARK: - Setap
    
    private func setupAllItems() {
        // генерим пользователей сохраняем в allItems
        allItems = User.randomMany.sorted {
            $0.fullName.lowercased() < $1.fullName.lowercased()
        }
    }
    
    private func reloadDataSource() {
        filterItems(text: searchBar.text)
        // из этих пользователей получаем уникальный массив букв взятых из фамилии и отсортированных и сохраняем в allLetters
        let allLetters = filtredItems.map { String($0.lastName.uppercased().prefix(1)) }
        sections = Array(Set(allLetters)).sorted()
        cachedSectionItems = [:] // обнуляем кэш
    }
    
    private func setupViews() {
        letterPicker.delegate = self
        letterPicker.letters = sections
    }
    
    // Mark: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let controller = segue.destination as? GaleryViewController,
            let indexPath = tableView.indexPathForSelectedRow
        else { return }
        
        let item = getItems(for: indexPath)
        controller.photos = item.photos
        controller.title = item.fullName
       
    }
    
    // Mark: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getItems(for: section).count
    } //количество строк секции
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FreindCell //Fc -т к у нас кастомная ячейка
        
        let item = getItems(for: indexPath)
        cell.avatarView.image = UIImage.loadAvatar(item.avatar)
        cell.nameLabel.text = item.fullName
        return cell
    } //формирование самой ячейки
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    } // вывод секции 
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.lightBlue
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
    }
    
    // Mark: - LetterPickerDelegate
    
    func letterPicked(_ letter: String) {
        guard  let sectionIndex = sections.firstIndex(where: { $0 == letter}) else { return }
        
        let indexPath = IndexPath(row: 0, section: sectionIndex)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
}

extension FreindsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(#function)
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        reloadDataSource()
        tableView.reloadData()
        letterPicker.letters = sections
    }
    
    
}
