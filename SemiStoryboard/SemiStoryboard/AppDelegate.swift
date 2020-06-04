//
//  AppDelegate.swift
//  SemiStoryboard
//
//  Created by Szabolcs Toth on 04/06/2020.
//  Copyright © 2020 purzelbaum.hu. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var mainWindowController = MainWindowController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        mainWindowController.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

