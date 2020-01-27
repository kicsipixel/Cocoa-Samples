//
//  Country.swift
//  SourceListView
//
//  Created by Szabolcs Toth on 6/14/17.
//  Copyright © 2017 purzelbaum.hu. All rights reserved.
//

import Cocoa

struct City {
    var cityName: String
}

struct Country {
    var countryName: String
    var flag: NSImage
    var cities: [City] = []
}

struct Continent {
    var continentName: String
    var countries: [Country] = []
}
