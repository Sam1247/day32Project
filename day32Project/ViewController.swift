//
//  ViewController.swift
//  day32Project
//
//  Created by Abdalla Elsaman on 3/7/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var shopingListItems = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shopping List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(clearData))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopingListItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Shopping Item", for: indexPath)
        cell.textLabel?.text = shopingListItems[indexPath.row]
        return cell
    }
    
    @objc func addItem () {
        let ac = UIAlertController(title: "Enter a shopping Item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [weak ac, weak self] _ in
            guard let item = ac?.textFields?[0].text! else { return }
            self?.submit(item)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit (_ item: String) {
        shopingListItems.insert(item, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    @objc func clearData () {
        shopingListItems.removeAll()
        tableView.reloadData()
    }

}

