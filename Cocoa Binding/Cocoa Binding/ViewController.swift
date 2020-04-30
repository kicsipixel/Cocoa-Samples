//
//  ViewController.swift
//  Cocoa Binding
//
//  Created by Szabolcs Toth on 30/04/2020.
//  Copyright © 2020 purzelbaum.hu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @objc dynamic var peopleArray: [Person] = [Person(firstName: "Ragnar", lastName: "Lothbrok", mobileNumber: "555-1234"),
                                               Person(firstName: "Bjorn", lastName: "Lothbrok", mobileNumber: "555-3412"),
                                               Person(firstName: "Harald", lastName: "Finehair", mobileNumber: "555-4512")
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

