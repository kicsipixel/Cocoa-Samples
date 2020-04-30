//
//  Person.swift
//  Cocoa Binding
//
//  Created by Szabolcs Toth on 30/04/2020.
//  Copyright © 2020 purzelbaum.hu. All rights reserved.
//

import Foundation

class Person: NSObject {
    @objc dynamic var firstName: String
    @objc dynamic var lastName: String
    @objc dynamic var mobileNumber: String
    
    init(firstName: String, lastName: String, mobileNumber: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.mobileNumber = mobileNumber
    }
}
