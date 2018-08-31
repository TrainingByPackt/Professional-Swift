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
		var seed = UInt(0)
		hash_combine(seed: &seed, value: width.hashValue)
		hash_combine(seed: &seed, value: length.hashValue)
		hash_combine(seed: &seed, value: height.hashValue)
		return Int(bitPattern: seed)
	}
}

// https://codereview.stackexchange.com/a/148777
func hash_combine(seed: inout UInt, value: Int) {
	let tmp = UInt(bitPattern: value) &+ 0x9e3779b9 &+ (seed << 6) &+ (seed >> 2)
	seed ^= tmp
}

// should preferably be different
Crate(width: 2, length: 4, height: 3).hashValue
Crate(width: 4, length: 2, height: 3).hashValue
//: [Next](@next)

