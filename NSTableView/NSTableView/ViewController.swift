//
//  ViewController.swift
//  NSTableView
//
//  Created by Szabolcs Toth on 11/15/18.
//  Copyright © 2018 purzelbaum.hu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var tableView: NSTableView!
    
    // our variable
    var data: [[String: String]] = [[:]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adding people
        data = [
            [
                "firstName" : "Ragnar",
                "lastName" : "Lothbrok",
                "mobileNumber" : "555-1234"
            ],
            [
                "firstName" : "Bjorn",
                "lastName" : "Lothbrok",
                "mobileNumber" : "555-3412"
            ],
            [
                "firstName" : "Harald",
                "lastName" : "Finehair",
                "mobileNumber" : "555-4512"
            ]
        ]
        
        // reload tableview
        tableView.reloadData()
    }

}

extension ViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return (data.count)
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let person = data[row]
        
        guard let cell = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        cell.textField?.stringValue = person[tableColumn!.identifier.rawValue]!
        
        return cell
    }
}


