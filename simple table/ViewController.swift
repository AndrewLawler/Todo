//
//  ViewController.swift
//  simple table
//
//  Created by Andrew Lawler on 11/10/2019.
//  Copyright © 2019 andrewlawler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var names = [String]()
    
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var incorrect: UILabel!
    
    @IBAction func goBtn(_ sender: Any) {
        let input = inputText.text
        if input==""{
            inputText.text = ""
            incorrect.text = "Please enter something"
            tableView.isHidden = true
        }
        else {
            inputText.resignFirstResponder()
            tableView.isHidden = false
            if let index = names.firstIndex(of: input!) {
                names.remove(at: index)
            }
            else {
                names.append(input!)
            }
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "myCell")
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
    }


}

