//
//  WindowController.swift
//  NSTabView
//
//  Created by Szabolcs Toth on 11/19/18.
//  Copyright © 2018 purzelbaum.hu. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    
    var tabViewController: NSTabViewController?
    
  
    @IBOutlet var segmentedControl: NSSegmentedControl!
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        self.tabViewController = self.window?.contentViewController as? NSTabViewController
        
        if let window = window {
            if let view = window.contentView {
                view.wantsLayer = true
                window.titleVisibility = .hidden
                window.titlebarAppearsTransparent = true
                window.backgroundColor = .white
            }
        }

    }

    @IBAction func segmentedControlSwitched(_ sender: Any) {
        let segmentedControl = sender as! NSSegmentedControl
        self.tabViewController?.selectedTabViewItemIndex = segmentedControl.selectedSegment
    }
}
