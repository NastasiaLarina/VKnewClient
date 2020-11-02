//
//  MyGroupsViewController.swift
//  VKnewClient
//
//  Created by Анастасия Ларина on 18.10.2020.
//


import UIKit

class MyGroupsViewController: UITableViewController {

    var allGroups: [String] = []
    var groupFoto: [String] = []
    
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
        
        _ = tableView.dequeueReusableCell(withIdentifier: "Group", for: indexPath) as! GroupCell
        let groupFoto1 = groupFoto[indexPath.row]
        cell.labelName.text = allGroup
        cell.groupView.image = UIImage(named: groupFoto1)
        
        return cell
    }
    
    //
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            allGroups.remove(at: indexPath.row)
            groupFoto.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Segues обратный переход
    
    @IBAction func unwindFromAllGroups(_ sender: UIStoryboardSegue){
        guard
            let controller = sender.source as?  AllGroupsViewController,
            let indexPath = controller.tableView.indexPathForSelectedRow
        else { return }
        let group = controller.allGroups[indexPath.row]
        let fotoGroup = controller.groupFoto[indexPath.row]
        if allGroups.contains(group) && groupFoto.contains(fotoGroup){
            return
        }
        allGroups.append(group)
        tableView.reloadData()
        groupFoto.append(fotoGroup)
        tableView.reloadData()
       }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Hello"
    }
    /*
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        let label = UILabel()
        label.textColor = .red
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.text = "Aggsg"
        label.translatesAutoresizingMaskIntoConstraints = true
        
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    */
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderForAllGroup") as? HeaderForAllGroup else { return nil }
        return headerView
        
    }
    
    
}
