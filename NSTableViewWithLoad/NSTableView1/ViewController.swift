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
    
    func prepareDataToSave() -> String {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(people)
            return String(data: jsonData, encoding: .utf8)!
        } catch {
            return String(error.localizedDescription)
        }
    }
    
    @IBAction func loadButtonPressed(_ sender: Any) {
        let dialog = NSOpenPanel()
        
        dialog.title                       = "Choose a .table file";
        dialog.showsResizeIndicator        = true;
        dialog.showsHiddenFiles            = false;
        dialog.canChooseDirectories        = true;
        dialog.canCreateDirectories        = true;
        dialog.allowsMultipleSelection     = false;
        dialog.allowedFileTypes            = ["table"];
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK) {
            let result = dialog.url
            
            if (result != nil) {
                let jsonData = try! Data(contentsOf: result!)
                let decoder = JSONDecoder()
                let person = try! decoder.decode([Person].self, from: jsonData)
                
                people.append(contentsOf: person)
                tableView.reloadData()
            } else {
                // User clicked on "Cancel"
                return
            }
        }
        
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let savePanel = NSSavePanel()
        let filename = "MyTableData"
        savePanel.nameFieldStringValue = "\(filename).table"
        savePanel.begin { (result)  -> Void in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                let exportedFileURL = savePanel.url
                let data = self.prepareDataToSave().data(using: String.Encoding.utf8)
                
                FileManager.default.createFile(atPath: exportedFileURL!.path, contents: data, attributes: nil)
            }
        }
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
