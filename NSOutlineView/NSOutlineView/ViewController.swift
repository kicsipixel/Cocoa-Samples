//
//  ViewController.swift
//  NSOutlineView
//
//  Created by Szabolcs Toth on 6/14/17.
//  Copyright © 2017 purzelbaum.hu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSOutlineViewDelegate, NSOutlineViewDataSource {

    
    @IBOutlet var outlineView: NSOutlineView!
    
    let country1 = Country(country: "Norway")
    let country2 = Country(country: "England")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let person1 = Person(name: "Ragnar")
        let person2 = Person(name: "Rollo")
        let person3 = Person(name: "Bjorn")
        let person4 = Person(name: "Siggy")
        let person5 = Person(name: "Henry VII")
        let person6 = Person(name: "Henry VIII")
        
        let family1 = Family(familyName: "Lothbrok")
        let familty2 = Family(familyName: "Haraldson")
        let familty3 = Family(familyName: "Tudor")
        
        family1.member.append(person1)
        family1.member.append(person2)
        family1.member.append(person3)
        
        familty2.member.append(person4)
        
        familty3.member.append(person5)
        familty3.member.append(person6)
        
        country1.families.append(family1)
        country1.families.append(familty2)
        
        country2.families.append(familty3)
        
        // Allow HeaderCell to move up
        // outlineView.floatsGroupRows = false
        
    }

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let item: Any = item {
            switch item {
            case let country as Country:
                return country.families.count
            case let family as Family:
                return family.member.count
            default:
                return 0
            }
        } else {
            return 2
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let item: Any = item {
            switch item {
            case let country as Country:
                return country.families[index]
            case let family as Family:
                return family.member[index]
            default:
                return self
            }
        } else {
            switch index {
            case 0:
                return country1
            default:
                return country2
            }
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        switch item {
        case let country as Country:
            return (country.families.count > 0) ? true : false
        case let family as Family:
            return (family.member.count > 0) ? true : false
        default:
            return false
        }
    }
    
  /*
    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        switch item {
        case let country as Country:
            return true
        case let family as Family:
            return true
        default:
            return false
        }
    }
    */
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        switch item {
        case let country as Country:
            let view = outlineView.make(withIdentifier: "HeaderCell", owner: self) as! NSTableCellView
            if let textField = view.textField {
                textField.stringValue = country.country
            }
            return view
            
        case let family as Family:
            let view = outlineView.make(withIdentifier: "DataCell", owner: self) as! NSTableCellView
            if let textField = view.textField {
                textField.stringValue = family.familyName
            }
            return view
            
        case let person as Person:
            let view = outlineView.make(withIdentifier: "DataCell", owner: self) as! NSTableCellView
            if let textField = view.textField {
                textField.stringValue = person.name
            }
            return view
            
        default:
            return nil
        }
    }
}

