import Foundation

enum Animals {
    case cat
    case dog
    case rabbit
//    case hedgehog
}

enum Animals2 {
    case bird, snake
}

let cat = Animals.cat
cat

if cat == Animals.cat {
    print("This is a cat")
} else {
    print("This is not a cat")
}

// Switch must be exhastive, meaning it should cover all possible options of cat - all cases of Animal enum
switch cat {
case .cat:
    print("this is a cat")
case .dog:
    print("this is a dog")
case .rabbit:
    print("this is a rabbit")
}
// Enumerations can have associative values in swift

enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let someVar = Shortcut.wwwUrl(path: URL(filePath: "https:/google.com/1"))
// If you then were to compare using '==' operator - it would return error saying that Shortcut should conform to 'Equatable'
// for this we need to define the comparison for Shortcut
// someVar == Shortcut.wwwUrl(path: URL(filePath: "https:/google.com/1"))
enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, madeYear: Int)

    var manufacturer: String {
        switch self {
        case let .car(manufacturer, _), let .bike(manufacturer, _):
            return manufacturer
        }
    }
}

let bike = Vehicle.bike(manufacturer: "Harley", madeYear: 1990)
bike.manufacturer

// There is also enumerates with raw value

enum FamilyMember: String {
    case father = "dad"
    case brother = "bro"
    case sister = "sis"
    case mother = "mom"
}

FamilyMember.brother.rawValue

enum FavoriteEmoji: String, CaseIterable {
    case blush = "☺️"
    case rocket = "🚀"
    case fire = "🔥"
    case hello = "👋"
}

FavoriteEmoji.allCases.map(\.rawValue)

if let blush = FavoriteEmoji(rawValue: "☺️") {
    "found it"
    blush
} else {
    "not found"
}

if let snow = FavoriteEmoji(rawValue: "❄️") {
    "found it"
    snow
} else {
    "not found"
}

enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}

var me = Height.medium
me
me.makeLong()
me = Height.short

// Recursive enums (or indirect enums)
indirect enum IntOperations {
    case add(Int, Int)
    case subtract(Int, Int)
    case freeHand(IntOperations)

    func calculateResult(of operation: IntOperations? = nil) -> Int {
        switch operation ?? self {
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .subtract(lhs, rhs):
            return lhs - rhs
        case let .freeHand(operation):
            return calculateResult(of: operation)
        }
    }
}

let freeHand = IntOperations.freeHand(.add(3, 5))
freeHand.calculateResult()

enum Planet: String {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let planet = Planet(rawValue: "mercury")
