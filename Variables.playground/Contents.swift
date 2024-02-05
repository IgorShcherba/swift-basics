import Foundation

// let - for constants and var for variables
let name = "Igor"

let lastName = "Shcherba"

var names = [name, lastName]

names.append("Bar")

names = ["New", "Values"]

let foo = "Foo"
let bar = foo

print(bar)

let moreNames = ["Olya", "Oleg"]

var arr2 = moreNames

arr2.append("One")
moreNames
// Reference type - behavez as arrays and objects in JS
let mutableArr = NSMutableArray(array: [1, 2, 3])

mutableArr.add(2)

let copy = mutableArr

copy.add(122)
mutableArr
// Example of how you shouldn't do - mutating argument of a function
func changeArray(_arr: NSArray) {
    let copy = _arr as! NSMutableArray
    copy.add(90)
}

changeArray(_arr: mutableArr)
mutableArr
