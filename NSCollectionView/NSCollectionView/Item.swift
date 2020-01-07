//
//  Item.swift
//  NSCollectionView
//
//  Created by Szabolcs Toth on 06/01/2020.
//  Copyright © 2020 purzelbaum.hu. All rights reserved.
//

import Cocoa

class Item: NSCollectionViewItem {

    @IBOutlet var letterLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
