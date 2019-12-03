//
//  ViewController.swift
//  SplitViewController
//
//  Created by Szabolcs Toth on 30/11/2019.
//  Copyright © 2019 purzelbaum.hu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSOutlineViewDelegate, NSOutlineViewDataSource {
    
    @IBOutlet var outlineView: NSOutlineView!
    
    var family1 = Family(familyName: "Walton")
    var family2 = Family(familyName: "Porsche")
    var people = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
 
        let person1 = Person(firstName: "Jim", lastName: "Walton")
        people.append(person1)
        
        let person2 = Person(firstName: "Alice", lastName: "Walton")
        people.append(person2)
        
        let person3 = Person(firstName: "Wolfgang", lastName: "Porsche")
        people.append(person3)
        
        let person4 = Person(firstName: "S. Robson", lastName: "Walton")
        people.append(person4)
        
        let person5 = Person(firstName: "Lukas", lastName: "Walton")
        people.append(person5)
        
        for person in people {
            if person.lastName == family1.familyName {
                family1.members.append(person)
            } else {
                family2.members.append(person)
            }
        }
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
          if let item: Any = item {
              switch item {
              case let family as Family:
                  return family.members.count
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
              case let family as Family:
                  return family.members[index]
              default:
                  return self
              }
          } else {
              switch index {
              case 0:
                  return family1
              default:
                  return family2
              }
          }
      }
      
      func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
          switch item {
          case let family as Family:
              return (family.members.count > 0) ? true : false
          default:
              return false
          }
      }
      
      
      func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
          switch item {
          case let family as Family:
              let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self) as! NSTableCellView
              if let textField = view.textField {
                  textField.stringValue = family.familyName
              }
              return view
              
          case let person as Person:
              let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self) as! NSTableCellView
              if let textField = view.textField {
                  textField.stringValue = person.firstName
              }
              return view
              
          default:
              return nil
          }
      }
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        let selectedRow = outlineView.selectedRow
        
        guard let splitVC = parent as? NSSplitViewController else { return }
        
        // Nothing is selected
        if selectedRow == -1 {
            return
        }
        
        if let item = outlineView.item(atRow: selectedRow) {
        
        // If the selected row category or subitem
            if let item = item as? Family {
                if let detail = splitVC.children[1] as? DetailViewController {
                    detail.dataFromOtherView(data: item)
                }
            } else if let item = item as? Person {
                if let detail = splitVC.children[1] as? DetailViewController {
                    detail.dataFromOtherView(data: item)
                }
            }
        }
    }

}

