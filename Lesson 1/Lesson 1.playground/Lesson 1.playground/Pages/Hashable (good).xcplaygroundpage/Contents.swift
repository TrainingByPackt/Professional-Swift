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

extension Crate: Hashable {
	public var hashValue: Int {
		return width.hashValue ^ length.hashValue ^ height.hashValue
	}
}

// should preferably be different
Crate(width: 2, length: 4, height: 3).hashValue
Crate(width: 4, length: 2, height: 3).hashValue
//: [Next](@next)

