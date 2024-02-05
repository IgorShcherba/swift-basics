import Foundation

let myInt = 1

let myInt2 = 4

myInt < myInt2

if myInt < myInt2 {
    print("Some", "Text", separator: "_")
}

// Unary prefix
let booleanVar = true

!booleanVar
// Unary postfix

let a = Optional(myInt)
let b = a!
type(of: a)

type(of: b)

// Binary infix
let c = "Some" + " " + "Text"

// Ternary operator

let age = 37

let message = age < 18 ? "You'r an adult" : "You're not yet an adult"
