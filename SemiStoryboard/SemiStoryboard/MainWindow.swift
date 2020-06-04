//
//  MainWindow.swift
//  SemiStoryboard
//
//  Created by Szabolcs Toth on 04/06/2020.
//  Copyright © 2020 purzelbaum.hu. All rights reserved.
//

import Cocoa

class MainWindow: NSWindow {
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
           super.init(contentRect: contentRect, styleMask: [.miniaturizable, .closable, .resizable, .titled],  backing: .buffered, defer: true)
            isMovableByWindowBackground = true
        }
}
