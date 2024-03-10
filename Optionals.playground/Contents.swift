import Foundation

let username: String? = nil

if let username = username {
    print(username)
} else {
    print("its nil")
}

let anotherOptional: Int? = 59

func someFunc(_ val: Int?) {
    guard let unwrapped = anotherOptional else {
        print("no value")
        return
    }
    print(unwrapped)
}

someFunc(anotherOptional)

// Optionals need to be unwrapped before usage

// Write an function that accepts an optional [Int] and returns a random itemof it or if it's empty -
// a random Int in rang of 1 ...100

func getRandomItem(_ arr: [Int]?) -> Int {
    arr?.randomElement() ?? Int.random(in: 1 ... 100)
}
