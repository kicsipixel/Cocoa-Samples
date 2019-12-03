//
//  Person.swift
//  SplitViewController
//
//  Created by Szabolcs Toth on 30/11/2019.
//  Copyright © 2019 purzelbaum.hu. All rights reserved.
//

import Foundation

struct Person {
    var firstName: String
    var lastName: String
}

struct Family {
    var members: [Person] = []
    var familyName: String
}
