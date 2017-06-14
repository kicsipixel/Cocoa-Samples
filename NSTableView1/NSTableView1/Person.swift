//
//  Person.swift
//  NSTableView1
//
//  Created by Szabolcs Toth on 6/14/17.
//  Copyright © 2017 purzelbaum.hu. All rights reserved.
//

import Cocoa

class Person: NSObject {
    let firstName: String
    let lastName: String
    let mobileNumber: String
    
    init(firstName: String, lastName: String, mobileNumber: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.mobileNumber = mobileNumber
    }

}
