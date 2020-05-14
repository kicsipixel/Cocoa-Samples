//
//  ViewController.swift
//  Cocoa Binding
//
//  Created by Szabolcs Toth on 30/04/2020.
//  Copyright © 2020 purzelbaum.hu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @objc dynamic var peopleArray: [Person] = [Person(firstName: "Ragnar", lastName: "Lothbrok", mobileNumber: "555-12347"),
                                               Person(firstName: "Bjorn", lastName: "Lothbrok", mobileNumber: "555-34129"),
                                               Person(firstName: "Harald", lastName: "Finehair", mobileNumber: "555-45128")
                                                ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

