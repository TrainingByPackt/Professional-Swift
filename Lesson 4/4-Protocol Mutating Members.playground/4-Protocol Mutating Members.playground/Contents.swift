//
//  4-Protocols default implementation.playground
//  Packt Progressional Swift Courseware
//
//  Created by robkerr@mobiletoolworks.com on 8/17/17.
//
import UIKit

protocol Employee {
    var name: String {get set}
    mutating func changeName(newName: String)
}

struct HourlyEmployee: Employee {
    var name: String

    mutating func changeName(newName: String) {
        name = newName
    }
}

struct Manager: Employee {
    var name: String
    mutating func changeName(newName: String) {
        name = newName
    }
}

var john = HourlyEmployee(name: "John Smith")
var sarah = Manager(name: "Sarah Jones")

print(john.name)

john.changeName(newName: "John Smyth")

print(john.name)
