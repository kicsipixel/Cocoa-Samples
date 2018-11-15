//
//  ViewController.swift
//  NSTableView1
//
//  Created by Szabolcs Toth on 6/14/17.
//  Copyright © 2017 purzelbaum.hu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    
    @IBOutlet var tableView: NSTableView!
    var people: [Person] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let person1 = Person.init(firstName: "Ragnar", lastName: "Lothbrok", mobileNumber: "555-1234")
        let person2 = Person.init(firstName: "Bjorn", lastName: "Lothbrok", mobileNumber: "555-3412")
        let person3 = Person.init(firstName: "Harald", lastName: "Finehair", mobileNumber: "555-4512")
        people.append(person1)
        people.append(person2)
        people.append(person3)
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        guard let cell = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }

        if (tableColumn?.identifier)!.rawValue == "firstName" {
            cell.textField?.stringValue = people[row].firstName
        } else if (tableColumn?.identifier)!.rawValue == "lastName" {
            cell.textField?.stringValue = people[row].lastName
        } else {
            cell.textField?.stringValue = people[row].mobileNumber
        }
        
        return cell
    }

}
