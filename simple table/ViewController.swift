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
    
    @IBAction func goBtn(_ sender: Any) {
        let input = inputText.text
        inputText.text = ""
        if input==""{
            inputText.text = ""
        }
        else {
            inputText.resignFirstResponder()
            if let index = names.firstIndex(of: input!) {
                names.remove(at: index)
            }
            else {
                names.append(input!)
            }
            tableView.reloadData()
            if names.count==0 {
                tableView.isHidden = true
            }
            else {
                tableView.isHidden = false
            }
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

