//
//  DetailViewController.swift
//  SplitViewController
//
//  Created by Szabolcs Toth on 30/11/2019.
//  Copyright © 2019 purzelbaum.hu. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {

    @IBOutlet var tableView: NSTableView!
    var dataArray = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func dataFromOtherView(data: Any) {
        if let data = data as? Family {
            // Empty the array
            dataArray.removeAll()
            dataArray = data.members
            tableView.reloadData()
        }
        
        if let data = data as? Person {
            // Empty array
            dataArray.removeAll()
            dataArray.append(data)
            tableView.reloadData()
        }
    }
}

extension DetailViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let person = dataArray[row]
        
        guard let cell = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        
        if (tableColumn?.identifier)!.rawValue == "firstName" {
            cell.textField?.stringValue = person.firstName
        } else {
            cell.textField?.stringValue = person.lastName
        }
        
        return cell
    }
}
