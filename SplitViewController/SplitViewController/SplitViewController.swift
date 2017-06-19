//
//  SplitViewController.swift
//  SplitViewController
//
//  Created by Szabolcs Toth on 6/15/17.
//  Copyright © 2017 purzelbaum.hu. All rights reserved.
//

import Cocoa

class SplitViewController: NSSplitViewController {

    @IBOutlet var outlineView: NSSplitViewItem!
    @IBOutlet var tableView: NSSplitViewItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
