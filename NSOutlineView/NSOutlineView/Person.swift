//
//  Person.swift
//  NSOutlineView
//
//  Created by Szabolcs Toth on 6/14/17.
//  Copyright © 2017 purzelbaum.hu. All rights reserved.
//

import Cocoa

class Person: NSObject {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class Family: NSObject {
    let familyName: String
    var member: [Person] = []
    
    init(familyName: String) {
        self.familyName = familyName
    }
}

class Country: NSObject {
    let country: String
    var families: [Family] = []
    
    init(country: String) {
        self.country = country
    }
}
