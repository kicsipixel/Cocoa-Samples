//
//  Model.swift
//  SplitViewController
//
//  Created by Szabolcs Toth on 6/15/17.
//  Copyright © 2017 purzelbaum.hu. All rights reserved.
//

import Cocoa
var people: [Person] = []
var families: [Family] = []

class Person: NSObject {
    let firstName: String
    let lastName: String
    
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

func newPeople() {
    let person1 = Person(firstName: "John", lastName: "Smith")
    let person2 = Person(firstName: "Helen", lastName: "Smith")
    let person3 = Person(firstName: "Alex", lastName: "Gandalf")
    
    people.append(person1)
    people.append(person2)
    people.append(person3)
    
    let family1 = Family(familyName: "Smith")
    let family2 = Family(familyName: "Gandalf")
    
    family1.members.append(person1)
    family1.members.append(person2)
    family2.members.append(person3)
    
    families.append(family1)
    families.append(family2)
}

class Family: NSObject {
    let familyName: String
    var members: [Person] = []
    
    init(familyName: String) {
            self.familyName = familyName
    }
}
