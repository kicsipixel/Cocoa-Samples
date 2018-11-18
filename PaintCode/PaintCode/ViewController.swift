//
//  ViewController.swift
//  PaintCode
//
//  Created by Szabolcs Toth on 11/18/18.
//  Copyright © 2018 purzelbaum.hu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var origamiImage: NSImageView!
    @IBOutlet var customImageTextField: NSTextField!
    @IBOutlet var imageViewTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        origamiImage.image = PaintCode.imageOfOrigami
        
        // Using the colors defined in PaintCode
        customImageTextField.textColor = PaintCode.fillColor5
        imageViewTextField.textColor = PaintCode.fillColor6
    }
}

