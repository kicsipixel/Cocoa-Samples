//
//  Origami.swift
//  PaintCode
//
//  Created by Szabolcs Toth on 11/18/18.
//  Copyright © 2018 purzelbaum.hu. All rights reserved.
//

import Cocoa

class Origami: NSImageView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        PaintCode.drawOrigami()
    }
    
}
