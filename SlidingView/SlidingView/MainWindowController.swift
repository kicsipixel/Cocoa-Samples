//
//  MainWindowController.swift
//  SlidingView
//
//  Created by Szabolcs Toth on 11/04/2020.
//  Copyright © 2020 purzelbaum.hu. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

        convenience init() {
            self.init(windowNibName: "")
        }
            
        override func loadWindow() {
            // MARK: Create window
            let windowSize = NSSize(width: 600, height: 300)
            let screenSize = NSScreen.main?.frame.size ?? .zero
            let rect = NSMakeRect(screenSize.width / 2 - windowSize.width / 2, screenSize.height / 2 - windowSize.height / 2, windowSize.width, windowSize.height)
            window = MainWindow(contentRect: rect, styleMask: [], backing: .buffered, defer: true)
            self.window?.title = "Sliding View"
            self.window?.titlebarAppearsTransparent = true
            self.window?.styleMask.insert(.fullSizeContentView)
            self.window?.contentViewController = BaseViewController()
        }
        
    }

