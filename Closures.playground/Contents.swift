import Foundation

// { (<#parameters#>) -> <#return type#> in
//   <#statements#>
// }

let add: (Int, Int) -> Int = {
    (lhs: Int, rhs: Int) -> Int in
    lhs + rhs
}

add(23, 432)

func customAdd(_ lhs: Int, _ rhs: Int, using function: (Int, Int) -> Int) -> Int {
    function(lhs, rhs)
}

// customAdd(43, 332, using: add)
// Trailing closure syntax - when we call a function that accepts a closure we can write it like this:
customAdd(
    20,
    30
) { (lhs: Int, rhs: Int) -> Int in
    rhs + lhs
}

// Or the full syntax will like like this:
customAdd(11, 21, using: { (_ lhs: Int, _ rhs: Int) -> Int in lhs + rhs })
// Or we just pass a closure like this
customAdd(30, 59, using: add)

var names = ["Alex", "Boris", "Cel", "Darwin"]

names.sort(by: { (a: String, b: String) -> Bool in a > b })

names.sort(by: >)

func makeIncrementer(startValue: Int) -> () -> Int {
    var total: Int = startValue
    func incrementer() -> Int {
        total += 1

        return total
    }
    return incrementer
}

let incrementer = makeIncrementer(startValue: 30)

incrementer()

// 1. Write a closure that takes two integers and returns their sum. Use this closure to calculate the sum of a list of integer pairs.
let sumOfNumbers = { (a: Int, b: Int) -> Int in
    a + b
}

sumOfNumbers(3, 9)

// 2. String Sorting: Create a closure that takes two strings and returns a boolean indicating if the first is alphabetically before the second. Use this closure to sort an array of strings.
let compareStrings = { (str1: String, str2: String) -> Bool in
    print(str1 > str2)

    return str1 < str2
}

let chars: [String] = ["a", "c", "d", "m", "z", "l"]

chars.sorted(by: compareStrings)

// 3. Filtering Array: Write a closure that takes an integer and returns a boolean indicating whether the integer is even. Use this closure to filter an array of integers, returning only even numbers

let isEven: (Int) -> Bool = { (num: Int) -> Bool in
    num % 2 == 0
}

let numbers = [3, 4, 6, 10]
// even
numbers.filter(isEven)
// odd
numbers.filter(_: { $0 % 2 != 0 })

// 4. Map Transformation: Develop a closure that takes an integer and returns its square. Use this closure with the map function to transform an array of integers into an array of their squares.
let square: (Int) -> Int = { (num: Int) -> Int in
    num * num
}

let nums: [Int] = [2, 3, 4]

nums.map(square)

// 5. Custom Sort Function: Implement a closure that sorts an array of custom objects. For instance, if you have an array of Person objects with age and name properties, write a closure that sorts these objects by age.

struct Person {
    var name: String
    var age: Int
}

// Usage
let people: [Person] = [Person(name: "Igor", age: 36), Person(name: "Olya", age: 35), Person(name: "Oleh", age: 8)]

let byAgePredicate: (Person, Person) -> Bool = { (item1: Person, item2: Person) -> Bool in
    item1.age < item2.age
}

people.sorted(by: byAgePredicate)

// 6. Closure as a Function Parameter: Write a function that takes a closure as a parameter. This closure should take an integer and return a string. The function should apply the closure to a range of numbers and return an array of its results. For example, the closure could convert numbers to their corresponding ordinal names (1 -> "first", 2 -> "second", etc.).

let intToString: (Int) -> String = { (num: Int) -> String in
    String(num)
}

func convertPrices(_ prices: [Int], _ converter: (Int) -> String) -> [String] {
    return prices.map(converter)
}

let varia: Bool = .random()

convertPrices(numbers, intToString)
