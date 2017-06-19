//
//  OutlineViewController.swift
//  SplitViewController
//
//  Created by Szabolcs Toth on 6/15/17.
//  Copyright © 2017 purzelbaum.hu. All rights reserved.
//

import Cocoa

class OutlineViewController: NSViewController, NSOutlineViewDelegate, NSOutlineViewDataSource {
    
    @IBOutlet var outlineView: NSOutlineView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        newPeople()
    }
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let item: Any = item {
            switch item {
            case let families as Family:
                return families.members.count
            default:
                return 0
            }
        } else {
            return families.count
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let item: Any = item {
            switch item {
            case let families as Family:
                return families.members[index]
            default:
                return self
            }
        } else {
                return families[index]
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        switch item {
        case let families as Family:
            return (families.members.count > 0) ? true : false
        default:
            return false
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        switch item {
        case let families as Family:
            let view = outlineView.make(withIdentifier: "HeaderCell", owner: self) as! NSTableCellView
            if let textField = view.textField {
                textField.stringValue = families.familyName
            }
            return view
            
        case let person as Person:
            let view = outlineView.make(withIdentifier: "DataCell", owner: self) as! NSTableCellView
            if let textField = view.textField {
                textField.stringValue = person.firstName
            }
            return view
            
        default:
            return nil
        }
    }
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        guard let outlineView = notification.object as? NSOutlineView else {
            return
        }
 
        let selectedIndex = outlineView.selectedRow
        
        if selectedIndex != -1 {
            if let item = outlineView.item(atRow: selectedIndex) {
                if (item is Person) {
                    people = []
                    people.append(item as! Person)
                } else {
                    people = []
                    people = (item as! Family).members
                }
            }
        } else {
            people = []
            newPeople()
        }

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reLoad"), object: nil)
    }
    
            
}
