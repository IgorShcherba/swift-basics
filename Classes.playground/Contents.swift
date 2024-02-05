import Foundation

struct PersonS {
    var name: String
    var age: Int
}

// Class has to have constructor (in contrast to structs)
class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.age = age
        self.name = name
    }

    func increaseAge() {
        self.age += 1
    }
}

// Second difference is that classes allow for inturnal mutability
let me = Person(name: "Igor", age: 36)

me.increaseAge()
me.age
// Third difference is that classes are Reference types (same as objects in JS)

let anothePerson = me

anothePerson.increaseAge()
me.age

if anothePerson === me {
    "anothePerson points to the same memory as me"
} else {
    "doesn't point to the same memory"
}

class Vehicle {
    func goVroom() {
        "Vroom vroom"
    }
}

class Car: Vehicle {}

let car = Car()

car.goVroom()

class Person2 {
    private(set) var age: Int

    init(age: Int) {
        self.age = age
    }

    func increaseAge() {
        self.age += 1
    }
}

let person2 = Person2(age: 56)
// This will raise an Error since age is privet(set)
// person2.age = 89
person2.increaseAge()

// Classes can have designated (the usual default init) initializers or convinience initializers
class Tesla {
    var manufactorer = "Tesla"
    var model: String
    var year: Int
    // this is a designated initializer
    init() {
        self.model = "X"
        self.year = 2020
    }

    // this is also a designated initializer
    init(model: String, year: Int) {
        self.model = model
        self.year = year
    }

    convenience init(model: String) {
        self.init(model: model, year: 2023)
    }
}

class ModelY: Tesla {
    override init() {
        super.init(model: "Y", year: 2023)
        // You cannot call a convinience init in a subclass - only in a supercalss
//        super.init(model: "Y")
    }

    func doSomething() {
        print("Do something")
    }

    deinit {
        print("Deinit call")
    }
}

let myClosure = {
    let modelY = ModelY()
    modelY.doSomething()
}

myClosure()
