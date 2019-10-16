//
//  ViewController.swift
//  simple table
//
//  Created by Andrew Lawler on 11/10/2019.
//  Copyright © 2019 andrewlawler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var todos = [String]()
    var mySeq = [String]()
    var sequenceNumber = 0
    
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
            if let index = todos.firstIndex(of: input!) {
                todos.remove(at: index)
                mySeq.remove(at: index)
            }
            else {
                sequenceNumber += 1
                mySeq.append("#\(sequenceNumber)")
                todos.append(input!)
            }
            tableView.reloadData()
            if todos.count==0 {
                tableView.isHidden = true
            }
            else {
                tableView.isHidden = false
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "myCell")
        cell.textLabel?.text = todos[indexPath.row]
        cell.detailTextLabel?.text = mySeq[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt
    indexPath: IndexPath) {
        if editingStyle == .delete {
            self.tableView.beginUpdates()
            self.todos.remove(at: indexPath.row)
            self.mySeq.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.endUpdates()
            tableView.reloadData()
            if todos.count==0 {
                tableView.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
    }

}

