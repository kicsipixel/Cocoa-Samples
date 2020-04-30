//
//  BaseViewController.swift
//  SlidingView
//
//  Created by Szabolcs Toth on 11/04/2020.
//  Copyright © 2020 purzelbaum.hu. All rights reserved.
//

import Cocoa

class BaseViewController: NSViewController {
    
    var topView = NSView()
    var baseButton = NSButton()
    var baseButton2 = NSButton()
    
    var createTopView: NSView {
        topView = .init(frame: NSRect(x: -600, y: 0, width: 600, height: 300))
        topView.wantsLayer = true
        topView.layer?.backgroundColor = NSColor.white.cgColor
        topView.addSubview(createButton2)
        return topView
    }
    
    var createButton: NSButton {
        baseButton = .init(frame: NSRect(x: Int(self.view.frame.size.width) / 2 - 75, y: Int(self.view.frame.size.height) / 2 - 20, width: 150, height: 40))
        baseButton.title = "Hello"
        baseButton.bezelStyle = .regularSquare
        baseButton.action = #selector(blabla)
        return baseButton
    }
    
    var createButton2: NSButton {
        baseButton2 = .init(frame: NSRect(x: Int(self.view.frame.size.width) / 2 - 75, y: Int(self.view.frame.size.height) / 2 - 20, width: 150, height: 40))
        baseButton2.title = "Good bye"
        baseButton2.bezelStyle = .regularSquare
        baseButton2.action = #selector(mumumu)
        return baseButton2
    }
    
    init() {
         super.init(nibName: nil, bundle: nil)
     }
         
    required init?(coder: NSCoder) {
         fatalError()
     }

    override func viewWillAppear() {
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = NSView()
        view.frame.size = CGSize(width: 600, height: 300)
        self.view.addSubview(createButton)
        self.view.addSubview(createTopView)
        
    }
    
    @objc func blabla() {
        CATransaction.begin()
        let animationFromLeft = CABasicAnimation(keyPath: "position.x")
        animationFromLeft.timingFunction = .init(name: CAMediaTimingFunctionName.easeInEaseOut)
        animationFromLeft.duration = 3
        animationFromLeft.toValue = 0
        animationFromLeft.autoreverses = false
        
        topView.layer?.add(animationFromLeft, forKey: nil)
        
        CATransaction.setCompletionBlock {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.7) {
                self.topView.layer?.position.x = 0
                self.createButton2.action = #selector(self.mumumu)
            }
        }
        CATransaction.commit()
        
    }
    
    @objc func mumumu() {
        print("mumumu")
    }
}
