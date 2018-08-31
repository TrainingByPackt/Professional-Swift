//: [Previous](@previous)
struct Crate {
	var width, length, height: Float
	var volume: Float {
		return width * length * height
	}
}


let a = Crate(width: 2, length: 3, height: 1)
let b = Crate(width: 3, length: 2, height: 1)
let c = Crate(width: 3, length: 2, height: 2)

// 1 of these should be true
a==b
a<b
b<a

// all of these should be true
!(a < a)
a < b ? !(b < a) : true
(a < b && b < c) ? a < c : true

// should preferably be different
Crate(width: 2, length: 4, height: 3).hashValue
Crate(width: 4, length: 2, height: 3).hashValue

//: [Next](@next)
