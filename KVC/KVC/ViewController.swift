//
//  ViewController.swift
//  KVC
//
//  Created by Szabolcs Toth on 02/06/2020.
//  Copyright © 2020 purzelbaum.hu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @objc dynamic var temperature: Int = 68
    @objc dynamic var isItOn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func coolerPressed(_ sender: Any) {
        temperature -= 1
    }
    
    @IBAction func warmerPressed(_ sender: Any) {
        temperature += 1
    }
}

