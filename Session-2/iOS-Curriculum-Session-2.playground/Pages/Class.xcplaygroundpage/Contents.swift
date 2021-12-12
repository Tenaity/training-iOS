//: [Previous](@previous)

import Foundation

/*:
 # Class
 
 Swift has another way of building complex data types called classes. They look similar to structs, but have a number of important differences, including:

 You don't get an automatic memberwise initializer for your classes; you need to write your own.
 You can define a class as being based off another class, adding any new things you want.
 When you create an instance of a class it’s called an object. If you copy that object, both copies point at the same data by default – change one, and the copy changes too.
 All three of those are massive differences, so I'm going to cover them in more depth before continuing.

 ----
 */
//  - Definition Syntax
class Person {
    var clothes: String
    var shoes: String
    
    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
    
    init(setup clothes: String, _ shoes: String = "") {
        self.clothes = clothes
        self.shoes = shoes
    }
}

class OriginalPerson {
    var clothes: String = ""
    var shoes: String = ""
}
/*:
 - First, you don't write func before your init() method, because it's special. Second, because the parameter names being passed in are the same as the names of the properties we want to assign, you use self. to make your meaning clear – "the clothes property of this object should be set to the clothes parameter that was passed in." You can give them unique names if you want – it's down to you.

 - Important: Swift requires that all non-optional properties have a value by the end of the initializer, or by the time the initializer calls any other method – whichever comes first.


 
 */
// - Instances
let original = OriginalPerson.init()

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")

let other = Person(clothes: "short skirts", shoes: "boot")

let tomy = Person.init(clothes: "dress", shoes: "")

let lisa = Person(setup: "Bikini")

let lisa_other = Person(setup: "dress", "jackboot")
/*:
 
 - Once you have created an instance of a class, you can read its properties just by writing the name of the class, a period, then the property you want to read:

 */
// - Accessing Properties
print("Person: \(taylor.clothes)")
print("Person: \(other.shoes)")
print("Person: clothes-> :\(original.clothes): shoes -> :\(original.shoes)")
/*:
 
 - Classes Are Reference Types.
 - Unlike value types, reference types are not copied when they’re assigned to a variable or constant, or when they’re passed to a function. Rather than a copy, a reference to the same existing instance is used.
 
 */
class Student {
    var name: String
    var address: String
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
}

let doan = Student(name: "Doan", address: "Da Nang")
let khoa = Student(name: "Khoa", address: "Quang Nam")

var doanReference = doan
doanReference.name = "Diep"

print("Student 1: \(doan.name)")
print("Student 2: \(doanReference.name)")
/*:
 
 - Functions inside class
 - You can place functions inside class, and in fact it’s a good idea to do so for all functions that read or change data inside the class.
 */
class Animal {
    let name: String
    var age: Int?
    var clothes: String?
    
    var infomation: String {
        return "Infomation: \n Name:\(name) \n Age:\(age) \n clothes:\(clothes)"
    }
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    init(name: String, age: Int, clothes: String) {
        self.name = name
        self.age = age
        self.clothes = clothes
    }
    
    func eat(_ eat: String = "") {
        if eat.isEmpty {
            print("\(name) is eating")
        } else {
            print("\(name) is eating :\(eat)")
        }
    }
    
    func run() {
        print("\(name) is running")
    }
    
    func update(age: Int) {
        self.age = age
    }

    func update(clothes: String?) {
        self.clothes = clothes
    }
}

let dog = Animal(name: "Ki")
//dog.eat()
//dog.run()
//print(dog.infomation)

//let cat = Animal(name: "MeoMeo", age: 2)
//cat.eat()
//
//let dog2 = Animal(name: "Lulu", age: 5, clothes: "shirt")
//dog2.eat()
//dog2.eat("Com")

dog.update(age: 10)
print(dog.infomation)

//cat.update(clothes: "Short")
//print(cat.infomation)

//: [Next](@next)
