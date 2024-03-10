import Foundation

protocol Vehicle {
    var maxSpeed: Int { get }
    static func someStaticMethod() -> Float
}

class Car: Vehicle {
    var maxSpeed: Int

    init(maxSpeed: Int) {
        self.maxSpeed = maxSpeed
    }

    static func someStaticMethod() -> Float {
        print("From static method")
        return 23.43
    }
}

let car1 = Car(maxSpeed: 40)

car1.maxSpeed

Car.someStaticMethod()
