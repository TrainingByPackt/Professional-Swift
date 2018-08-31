//
//  Activity 2-Generic Queue.playground
//  Packt Progressional Swift Courseware
//
//  Created by robkerr@mobiletoolworks.com on 8/17/17.
//
import UIKit

struct Queue<Member> {
    var members : [Member] = []
    
    mutating func add(member: Member) {
        members.append(member)
    }
    mutating func remove() -> Member? {
        if let topItem = members.first {
            members.remove(at: 0)
            return topItem
        }
        return nil
    }
}

struct Employee {
    var name: String
    var salary: Double
}

var q = Queue<Employee>()

q.add(member: Employee(name: "John Smith", salary: 50_000.0))
q.add(member: Employee(name: "Alan Stirk", salary: 55_000.0))
q.add(member: Employee(name: "Mary Adams", salary: 60_000.0))

for _ in 1...4 {
    print(q.remove() ?? "Empty Queue")
}
