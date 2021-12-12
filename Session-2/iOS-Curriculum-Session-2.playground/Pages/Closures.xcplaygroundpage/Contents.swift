//: [Previous](@previous)

import Foundation

/*:
 
 Closures are really difficult. I’m not saying that to put you off, only so that you know in advance if you’re finding closures hard to understand or hard to remember, it’s okay – we’ve all been there!

 Sometimes the syntax for closures can be a bit hard on your eyes, and this will really be apparent as you work through today’s lessons. If you find it a bit overwhelming – if you’re staring at some code and aren’t 100% sure of what it means – just go back one video and watch it again to give your memory a little nudge. You’ll find there are more tests and optional reading links than usual below, hopefully helping to solidify your knowledge.
 
 # How to create and use closures
 
 Functions are powerful things in Swift. Yes, you’ve seen how you can call them, pass in values, and return data, but you can also assign them to variables, pass functions into functions, and even return functions from functions.

 For example:
 
 */
//func greetUser() {
//    print("Hi there!")
//}

func greetUser() -> Void {
    print("Hi there!")
}

//greetUser()

var greetCopy = greetUser

//greetCopy()

/*:
 
 - That creates a trivial function and calls it, but then creates a copy of that function and calls the copy. As a result, it will print the same message twice.

 - Important: When you’re copying a function, you don’t write the parentheses after it – it’s **var greetCopy = greetUser** and not **var greetCopy = greetUser()**. If you put the parentheses there you are calling the function and assigning its return value back to something else.
 
 - But what if you wanted to skip creating a separate function, and just assign the functionality directly to a constant or variable? Well, it turns out you can do that too:
 
 */
let sayHello1 = {
    print("Hi there!")
}

sayHello1() // Call it like function
//sayHello1 // Call it like property

let sayHello2 = { (name: String) -> String in
    "Hi \(name)!"
}

print(sayHello2("Tony"))

func greetUser2(name: String) {
    print("Hi there!")
}

var greetCopy1: (String) -> Void = greetUser2
/*:
 
-  Let’s break that down…
    - The empty parentheses marks a function that takes no parameters.
    - The arrow means just what it means when creating a function: we’re about to declare the return type for the function.
    - Void means “nothing” – this function returns nothing. Sometimes you might see this written as (), but we usually avoid that because it can be confused with the empty parameter list.
 
 */
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
//print("User: \(user)")




let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print("sortedTeam: \(sortedTeam)")

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

let value1 = team.sorted(by: captainFirstSorted)
print("captainFirstTeam 1: \(value1)")





let captainFirstSorted2 = { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

let value2 = team.sorted(by: captainFirstSorted2)
print("captainFirstTeam 2: \(value2)")

//🍎 let’s write some new code that calls sorted() using a closure:
let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})
print("captainFirstTeam 2: \(captainFirstTeam2)")

/*:

 - But first I want to break down what’s happening there:
 
    - We’re calling the sorted() function as before.
    - Rather than passing in a function, we’re passing a closure – everything from the opening brace after by: down to the closing brace on the last line is part of the closure.
    - Directly inside the closure we list the two parameters sorted() will pass us, which are two strings. We also say that our closure will return a Boolean, then mark the start of the closure’s code by using in.
    - Everything else is just normal function code.
 
 ---
 # How to use trailing closures and shorthand syntax
 
 */
let shorthandStyle1 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

let shorthandStyle2 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}

let reverseTeamStyle1 = team.sorted {
    return $0 > $1
}

let reverseTeamStyle2 = team.sorted { $0 > $1 }

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

/*:
 
 # How to accept functions-closure as parameters
 
 */
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}
/*:
 
 - Let’s break that down…

    - The function is called makeArray(). It takes two parameters, one of which is the number of integers we want, and also returns an array of integers.
    - The second parameter is a function. This accepts no parameters itself, but will return one integer every time it’s called.
    - Inside makeArray() we create a new empty array of integers, then loop as many times as requested.
    - Each time the loop goes around we call the generator function that was passed in as a parameter. This will return one new integer, so we put that into the numbers array.
    - Finally the finished array is returned.
 
 - The body of the makeArray() is mostly straightforward: repeatedly call a function to generate an integer, adding each value to an array, then send it all back.
 
 */
let rolls = makeArray(size: 10, using: {
    Int.random(in: 1...9)
})

print("rolls: \(rolls)")

/*:
 
 There’s one last thing before we move on: you can make your function accept multiple function parameters if you want, in which case you can specify multiple trailing closures.
 */
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

/*:
 
 # Capturing Values
 A closure can capture constants and variables from the surrounding context in which it’s defined. The closure can then refer to and modify the values of those constants and variables from within its body, even if the original scope that defined the constants and variables no longer exists.

 In Swift, the simplest form of a closure that can capture values is a nested function, written within the body of another function. A nested function can capture any of its outer function’s arguments and can also capture any constants and variables defined within the outer function.

 Here’s an example of a function called makeIncrementer, which contains a nested function called incrementer. The nested incrementer() function captures two values, runningTotal and amount, from its surrounding context. After capturing these values, incrementer is returned by makeIncrementer as a closure that increments runningTotal by amount each time it’s called.
 
 
 */
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
//let value = makeIncrementer(forIncrement: 20)

incrementByTen()
// returns a value of 10
incrementByTen()
// returns a value of 20
incrementByTen()
// returns a value of 30

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
// returns a value of 7

incrementByTen()
// returns a value of 40
/*:
 
 If you assign a closure to a property of a class instance, and the closure captures that instance by referring to the instance or its members, you will create a strong reference cycle between the closure and the instance. Swift uses capture lists to break these strong reference cycles. For more information
 
 */

//: [Next](@next)
