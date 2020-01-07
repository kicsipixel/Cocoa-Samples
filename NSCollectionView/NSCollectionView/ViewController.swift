//
//  ViewController.swift
//  NSCollectionView
//
//  Created by Szabolcs Toth on 06/01/2020.
//  Copyright © 2020 purzelbaum.hu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var collectionView: NSCollectionView!
   
    let items = ["Aarne",
                        "Bertta",
                        "Celsius",
                        "Daavid",
                        "Eemeli",
                        "Faarao",
                        "Gideon",
                        "Heikki",
                        "Iivari",
                        "Jussi",
                        "Kalle",
                        "Lauri",
                        "Matti",
                        "Niilo",
                        "Otto",
                        "Paavo",
                        "kuu",
                        "Risto",
                        "Sakari",
                        "Tyyne",
                        "Urho",
                        "Vihtori",
                        "Viski",
                        "äksä",
                        "Yrjö",
                        "zeta",
                        "Åke",
                        "äiti",
                        "öljy" ]
    
    let backgroundColor = NSColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.35).cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: NSCollectionViewDataSource, NSCollectionViewDelegate {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "Item"), for: indexPath)
        
        guard let collectionViewItem = item as? Item else { return item }
        
        collectionViewItem.letterLabel.stringValue = self.items[indexPath.item]
        
        collectionViewItem.view.wantsLayer = true
        collectionViewItem.view.layer?.backgroundColor = backgroundColor
        
        return item
    }
    
    
}
