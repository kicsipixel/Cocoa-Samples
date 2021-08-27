//
//  ViewController.swift
//  SlidingViews
//
//  Created by Szabolcs Tóth on 2021. 08. 27..
//

import Cocoa

class ViewController: NSViewController {
    
    private let redView: NSView = {
        let view = NSView(frame: NSRect(x: 0, y: 0, width: 20, height: 20))
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.red.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let helloWorldLabelForRedView: NSTextField = {
        let label = NSTextField(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        label.stringValue = "Hello, World! I'm a red view."
        label.isEditable = false
        label.isBezeled = false
        label.backgroundColor = .clear
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let removeRedViewButton: NSButton = {
        let button = NSButton(frame: NSRect(x: 0, y: 0, width: 100, height: 40))
        button.title = "Move, Red View!"
        button.action = #selector(redAnimation)
        button.bezelStyle = .regularSquare
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Be more creative about naming
    private let helloWorldLabelForDefaultView: NSTextField = {
        let label = NSTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.stringValue = "Hello, World!"
        label.isEditable = false
        label.isBezeled = false
        label.backgroundColor = .clear
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Building UI
        view.addSubview(helloWorldLabelForDefaultView)
        view.addSubview(redView)
        view.addSubview(removeRedViewButton)
        redView.addSubview(helloWorldLabelForRedView)
        
        // Red View constraints
        let redViewConstraint = [
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redView.topAnchor.constraint(equalTo: view.topAnchor),
            redView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.85),
            redView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ]
        NSLayoutConstraint.activate(redViewConstraint)
        
        // NSTextField constraints
        let helloWorldLabelForRedViewConstraint = [
            helloWorldLabelForRedView.centerXAnchor.constraint(equalTo: redView.centerXAnchor),
            helloWorldLabelForRedView.centerYAnchor.constraint(equalTo: redView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(helloWorldLabelForRedViewConstraint)
        
        // NSBUtton constraints
        let removeRedViewButtonConstraint = [
            removeRedViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            removeRedViewButton.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(removeRedViewButtonConstraint)
        
        // NSTextField constaints again...
        let helloWorldLabelForDefaultViewConstaint = [
            helloWorldLabelForDefaultView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloWorldLabelForDefaultView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        NSLayoutConstraint.activate(helloWorldLabelForDefaultViewConstaint)
    }
    
    @objc func redAnimation() {
        let animationFromLeft = CABasicAnimation(keyPath: "position.x")
        animationFromLeft.timingFunction = .init(name: CAMediaTimingFunctionName.easeInEaseOut)
        animationFromLeft.duration = 3
        animationFromLeft.toValue = -480
        animationFromLeft.autoreverses = false
        
        redView.layer?.add(animationFromLeft, forKey: nil)
        
        CATransaction.setCompletionBlock {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.6) {
                self.redView.layer?.position.x = -480
            }
        }
        CATransaction.commit()
    }
}

