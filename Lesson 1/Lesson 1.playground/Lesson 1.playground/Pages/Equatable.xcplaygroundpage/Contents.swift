//: [Previous](@previous)

struct Crate: Equatable {
	var width, length, height: Float
	var volume: Float {
		return width * length * height
	}
	static func ==(lhs: Crate, rhs: Crate) -> Bool {
		return lhs.width == rhs.width
			&& lhs.length == rhs.length
			&& lhs.height == rhs.height
	}
}

//: [Next](@next)
