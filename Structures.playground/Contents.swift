import Foundation

// Structures are value types = it means the value is copied over when you assigned a structure's value to another variable.

struct Person {
    // Using let ot var we define properties
    let name: String
    let age: Int
}

// Instantiation of structure
let foo = Person(name: "Igor", age: 43)
foo.age
// custom properties initializer (aka construnctor)
struct CommodoreComputer {
    let name: String
    let manufactorer: String

    init(name: String) {
        self.name = name
        self.manufactorer = "Commodore"
    }
}

// initial value for a property
struct CommodoreComputer2 {
    let name: String
    let manufactorer: String = "Commodore"
}

let c64 = CommodoreComputer(name: "My")
let c65 = CommodoreComputer2(name: "Some name")

// computed properties
struct Person2 {
    let firstName: String
    let lastName: String
    // This is a computed property
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let me = Person2(firstName: "Igor", lastName: "Shcherba")
me.fullName

// How to make a mutable value of the struct

struct Car {
    var currentSpeed: Int
    mutating func drive(speed: Int) {
        currentSpeed = speed
    }
}

var mutableCar = Car(currentSpeed: 10)
let immutableCar2 = Car(currentSpeed: 30)
// immutableCar2.drive(speed: 50) - since this was defined usind let - this will cause an error
mutableCar.currentSpeed
mutableCar.drive(speed: 20)
mutableCar.currentSpeed
// Since structures are value types - the entire data will be copied over to copy and they will no have any connection whatsoever
var copy = mutableCar

copy.drive(speed: 14)

mutableCar.currentSpeed
copy.currentSpeed

// Structures cannot subclass other structures.So they can't 'inherit'

struct LivingThing {
    init() {
        print("I'm a living thing")
    }
}

// Error: inheritance from a non-protocol type 'LivingThing'
// struct Animal: LivingThing {}

// Custom copying of structures

struct Bike {
    let manufacturer: String
    let currentSpeed: Int

    func copy(speed: Int) -> Bike {
        Bike(manufacturer: manufacturer, currentSpeed: speed)
    }
}

let bike1 = Bike(manufacturer: "Canyon", currentSpeed: 30)
let bike2 = bike1.copy(speed: 40)
bike2.currentSpeed
bike1.currentSpeed
