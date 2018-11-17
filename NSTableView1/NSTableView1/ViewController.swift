//
//  ViewController.swift
//  NSTableView1
//
//  Created by Szabolcs Toth on 6/14/17.
//  Copyright © 2017 purzelbaum.hu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
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
}

extension ViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return (people.count)
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let person = people[row]
        
        guard let cell = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        
        if (tableColumn?.identifier)!.rawValue == "firstName" {
            cell.textField?.stringValue = person.firstName
        } else if (tableColumn?.identifier)!.rawValue == "lastName" {
            cell.textField?.stringValue = person.lastName
        } else {
            cell.textField?.stringValue = person.mobileNumber
        }
        
        return cell
    }
}
