//: [Previous](@previous)

import Foundation

/*:
 # Struct
 
 - Structs are complex data types, meaning that they are made up of multiple values. You then create an instance of the struct and fill in its values, then you can pass it around as a single value in your code.
 
 - For example, we could define a Person struct type that contains two properties: clothes and shoes:
 
 ----
 */
//  - Definition Syntax
struct Person {
    var clothes: String = ""
    var shoes: String = ""
}

//struct Person {
//    let clothes: String
//    let shoes: String
//}
/*:
 - When you define a struct, Swift makes them very easy to create because it automatically generates what's called a memberwise initializer. In plain speak, it means you create the struct by passing in initial values for its two properties, like this:
 
 */
// - Instances
let original = Person()
let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "boot")
let tomy = Person.init(clothes: "dress", shoes: "")
/*:
 
 - Once you have created an instance of a struct, you can read its properties just by writing the name of the struct, a period, then the property you want to read:

 */
// - Accessing Properties
print("Person: \(taylor.clothes)")
print("Person: \(other.shoes)")
print("Person: \(original.clothes)")
/*:
 - Struct Are Value Types.
 - If you assign one struct to another, Swift copies it behind the scenes so that it is a complete, standalone duplicate of the original. Well, that's not strictly true: Swift uses a technique called "copy on write" which means it only actually copies your data if you try to change it.
 - To help you see how struct copies work, put this into your playground:
 
 */
struct Student {
    var name: String
    var address: String
}

let doan = Student(name: "Doan", address: "Da Nang")
let khoa = Student(name: "Khoa", address: "Quang Nam")

var doanCopy = doan
doanCopy.name = "Diep"

print("Student: \(doan)")
print("Student: \(doanCopy)")
/*:
 
 - Functions inside structs
 - You can place functions inside structs, and in fact it’s a good idea to do so for all functions that read or change data inside the struct.
 */
struct Animal {
    let name: String
    
    func eat() {
        print("\(name) is eating")
    }
    
    func run() {
        print("\(name) is running")
    }
}

let dog = Animal(name: "Ki")
dog.eat()
dog.run()

//: [Next](@next)
