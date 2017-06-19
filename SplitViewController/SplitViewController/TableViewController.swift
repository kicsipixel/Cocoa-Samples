//
//  TableViewController.swift
//  SplitViewController
//
//  Created by Szabolcs Toth on 6/15/17.
//  Copyright © 2017 purzelbaum.hu. All rights reserved.
//

import Cocoa

class TableViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

  
    @IBOutlet var tableView: NSTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reLoadList), name: NSNotification.Name(rawValue: "reLoad"), object: nil)
    }
    
    func reLoadList() {
        tableView.reloadData()
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        guard let cell = tableView.make(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        
        if tableColumn?.identifier == "firstName" {
            cell.textField?.stringValue = people[row].firstName
        } else {
            cell.textField?.stringValue = people[row].lastName
        }
        
        return cell
    }
    
}
