import Foundation

func greeet(name: String, age: Float) -> String {
    let greeting = "Hello \(name) \(age)"
    return greeting
}

let returnValue: String = greeet(name: "Igor", age: 40.9494)

returnValue

@discardableResult
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

add(2, 322)

func getFullName (firstName:String = "DefaultValue", lastName:String)->String {
    return firstName + lastName
}

getFullName(firstName: "Olay",lastName: "Podles")
