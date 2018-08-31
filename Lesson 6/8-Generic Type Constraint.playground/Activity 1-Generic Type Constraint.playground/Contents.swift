//
//  Activity 1-Generic Type Constraint.playground
//  Packt Progressional Swift Courseware
//
//  Created by robkerr@mobiletoolworks.com on 8/17/17.
//
import UIKit

func maxValue<T: Comparable>(_ lhs: T, _ rhs: T) -> T {
    return lhs > rhs ? lhs : rhs
}

print(maxValue(5, 6))
print(maxValue(6,5))

struct Employee {
    var name: String
}
extension Employee: Comparable {
    public static func ==(lhs: Employee, rhs: Employee) -> Bool {
        return lhs.name == rhs.name
    }
    public static func <(lhs: Employee, rhs: Employee) -> Bool {
        return rhs.name < lhs.name
    }
    public static func >(lhs: Employee, rhs: Employee) -> Bool {
        return rhs.name > lhs.name
    }
}

let mary = Employee(name: "Mary Jones")
let sam = Employee(name: "Sam Davis")
let maxEmployee1 = maxValue(sam, mary)
print(maxEmployee1)
let maxEmployee2 = maxValue(mary, sam)
print(maxEmployee2)


