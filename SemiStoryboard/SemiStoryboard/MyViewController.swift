//
//  MyViewController.swift
//  SemiStoryboard
//
//  Created by Szabolcs Toth on 04/06/2020.
//  Copyright © 2020 purzelbaum.hu. All rights reserved.
//

import Cocoa

class MyViewController: NSViewController {
    
    init() {
         super.init(nibName: nil, bundle: nil)
     }
     
    required init?(coder: NSCoder) {
         fatalError()
     }

    override func viewDidLoad() {
    }
    
    override func loadView() {
        super.viewDidLoad()
        self.view = NSView()
        view.frame.size = CGSize(width: 600, height: 300)
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.white.cgColor
        
        let label = NSTextField()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        label.stringValue = "Hello, World!"
        label.backgroundColor = .white
        label.isBezeled = false
        label.isEditable = false
        label.sizeToFit()
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
              let labelConstraint = [
                  label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                  label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
              ]
        NSLayoutConstraint.activate(labelConstraint)
    }

}
