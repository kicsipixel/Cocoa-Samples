//
//  ViewController.swift
//  SourceListView
//
//  Created by Szabolcs Toth on 6/14/17.
//  Copyright © 2017 purzelbaum.hu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSOutlineViewDelegate, NSOutlineViewDataSource {
    
    @IBOutlet var outlineView: NSOutlineView!
    
    var continent1 = Continent(continentName: "Europe")
    var continent2 = Continent(continentName: "Asia")
    var continent3 = Continent(continentName: "Americas")

    override func viewDidLoad() {
        super.viewDidLoad()

        let city1 = City(cityName: "Berlin")
        let city2 = City(cityName: "Budapest")
        let city3 = City(cityName: "Tokyo")
        let city4 = City(cityName: "Mexico city")
        
        var country1 = Country(countryName: "Germany", flag: NSImage(named:"Germany")!)
        var country2 = Country(countryName: "Hungary", flag: NSImage(named:"Hungary")!)
        var country3 = Country(countryName: "Japan", flag: NSImage(named:"Japan")!)
        var country4 = Country(countryName: "Mexico", flag: NSImage(named:"Mexico")!)
        
        country1.cities.append(city1)
        country2.cities.append(city2)
        country3.cities.append(city3)
        country4.cities.append(city4)
        
        continent1.countries.append(country1)
        continent1.countries.append(country2)
        continent2.countries.append(country3)
        continent3.countries.append(country4)
    }
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let item: Any = item {
            switch item {
            case let continent as Continent:
                return continent.countries.count
            case let country as Country:
                return country.cities.count
            default:
                return 0
            }
        } else {
            return 3
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let item: Any = item {
            switch item {
            case let continent as Continent:
                return continent.countries[index]
            case let country as Country:
                return country.cities[index]
            default:
                return self
            }
        } else {
            switch index {
            case 0:
                return continent1
            case 1:
                return continent2
            default:
                return continent3
            }
        }
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        switch item {
        case let continent as Continent:
            return (continent.countries.count > 0) ? true : false
        case let country as Country:
            return (country.cities.count > 0) ? true: false
        default:
            return false
        }
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        switch item {
        case let continent as Continent:
            return true /*
        case let country as Country:
            return true */
        default:
            return false
        }
    }

    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        switch item {
        case let continent as Continent:
            let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "HeaderCell"), owner: self) as! NSTableCellView
            if let textField = view.textField {
                textField.stringValue = continent.continentName
            }
            return view
            
        case let country as Country:
            let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self) as! NSTableCellView
            if let textField = view.textField {
                textField.stringValue = country.countryName
            }
            
            let flagImage = country.flag
            view.imageView?.image = flagImage
            return view
            
            case let city as City:
                let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self) as! NSTableCellView

            if let textField = view.textField {
                textField.stringValue = city.cityName
                textField.frame.origin.x = 18.0
            }
            view.imageView?.image = nil
            return view
            
        default:
            return nil
        }
    }

}

