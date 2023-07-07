//
//  FavListViewController.swift
//  catfact
//
//  Created by subrata Samartha on 27/04/23.
//

import UIKit

class FavListViewController: UIViewController {

    @IBOutlet weak var factTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserData.shared.favFactArrat)
        // Do any additional setup after loading the view.
        
        //initialize nib file object
        let factCellNib = UINib(nibName: "FactTableViewCell", bundle: nil)
        factTableView.register(factCellNib, forCellReuseIdentifier: "factCell")
    }
    
}

extension FavListViewController: UITableViewDelegate {}

extension FavListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserData.shared.favFactArrat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let factCell = tableView.dequeueReusableCell(withIdentifier: "factCell") as! FactTableViewCell
        
        factCell.factStringLabel.text = UserData.shared.favFactArrat[indexPath.row]
        
        return factCell
    }
    
    //swipe action
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete", handler: { _, _, _ in
            	
            UserData.shared.favFactArrat.remove(at: indexPath.row)
            UserData.shared.updateUserData()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.factTableView.reloadData()
            
            
        })
        
        let swipeActionConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeActionConfiguration
    }
}
