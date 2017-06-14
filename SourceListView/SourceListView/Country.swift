//
//  Country.swift
//  SourceListView
//
//  Created by Szabolcs Toth on 6/14/17.
//  Copyright © 2017 purzelbaum.hu. All rights reserved.
//

import Cocoa

class City: NSObject {
    let cityName: String
    
    init(cityName: String) {
        self.cityName = cityName
    }
}

class Country: NSObject {
    let countryName: String
    let flag: NSImage
    var cities: [City] = []
    
    init(countryName: String, flag: NSImage) {
        self.countryName = countryName
        self.flag = flag
    }
}

class Continent: NSObject {
    let continentName: String
    var countries: [Country] = []
    
    init(continentName: String) {
        self.continentName = continentName
    }
}
