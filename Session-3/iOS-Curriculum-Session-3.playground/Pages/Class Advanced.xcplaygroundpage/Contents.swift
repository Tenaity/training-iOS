//: [Previous](@previous)

import Foundation

/*:
 
 # Class Advanced
 
 ## 1:  Class inheritance
 
 The second difference between classes and structs is that you can create a class based on an existing class – it inherits all the properties and methods of the original class, and can add its own on top.

 This is called class inheritance or subclassing, the class you inherit from is called the “parent” or “super” class, and the new class is called the “child” class.

 Here’s the Dog class we just created:

 */
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise() {
        print("Woof!")
    }
}
/*:
 
 - However, we can also give Poodle its own initializer. We know it will always have the breed “Poodle”, so we can make a new initializer that only needs a name property. Even better, we can make the Poodle initializer call the Dog initializer directly so that all the same setup happens:
 - For safety reasons, Swift always makes you call super.init() from child classes – just in case the parent class does some important work when it’s created.
 
 */
class Pitbull: Dog {
    init(name: String) {
        super.init(name: name, breed: "Pitbull")
    }
}
/*:
 
 ## 2:  Overriding methods
 
 -  Child classes can replace parent methods with their own implementations – a process known as overriding. Here’s a trivial Dog class with a makeNoise() method:
 -  Swift requires us to use override func rather than just func when overriding a method – it stops you from overriding a method by accident, and you’ll get an error if you try to override something that doesn’t exist on the parent class:
 
 */
class Alaska: Dog {
    init(name: String) {
        super.init(name: name, breed: "Alaska")
    }
    
    override func makeNoise() {
        print("Yip!")
    }
}

let kiki = Alaska(name: "kiki")
kiki.makeNoise()

/*:
 
 ## 3:  Final classes
 Although class inheritance is very useful – and in fact large parts of Apple’s platforms require you to use it – sometimes you want to disallow other developers from building their own class based on yours.

 Swift gives us a final keyword just for this purpose: when you declare a class as being final, no other class can inherit from it. This means they can’t override your methods in order to change your behavior – they need to use your class the way it was written.

 */
final class Animal {
    let name: String
    var age: Int?
    var clothes: String?
    
    init(name: String) {
        self.name = name
    }
}

// return error : Inheritance from a final class 'Animal'
//class Cat: Animal {
//
//}

/*:
 
 ## 3: Deinitializers
 -  The fourth difference between classes and structs is that classes can have deinitializers – code that gets run when an instance of a class is destroyed.
 -  To demonstrate this, here’s a Person class with a name property, a simple initializer, and a printGreeting() method that prints a message:

 */
class Person {
    var name = "Tony Dang"

    init() {
        print("\(name) is alive!")
    }

    deinit {
        print("\(name) is no more!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
}

//struct Person {
//    var name = "Tony Dang"
//
//    init() {
//        print("\(name) is alive!")
//    }
//
//    //Deinitializers may only be declared within a class
//    deinit {
//        print("\(name) is no more!")
//    }
//
//    func printGreeting() {
//        print("Hello, I'm \(name)")
//    }
//}

//We’re going to create a few instances of the Person class inside a loop, because each time the loop goes around a new person will be created then destroyed:
//And now for the deinitializer. This will be called when the Person instance is being destroyed:

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

/*:
 
 ## 4: Mutability class vs struct
 
 - The final difference between classes and structs is the way they deal with constants. If you have a constant struct with a variable property, that property can’t be changed because the struct itself is constant.

 - However, if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the mutating keyword with methods that change properties; that’s only needed with structs.
 
 - This difference means you can change any variable property on a class even when the class is created as a constant – this is perfectly valid code:
 
 */
struct Person2 {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person2 = Person2(name: "Ed Sheeran")
person2.makeAnonymous()
print(person2.name)

class Person3 {
    var name: String = ""

    func makeAnonymous() {
        name = "Anonymous"
    }
}

let person3 = Person3()
person3.makeAnonymous()
print(person3.name)
/*:
 
 ## 4: How to limit access to internal data using access control for class or struct
 By default, Swift’s structs let us access their properties and methods freely, but often that isn’t what you want – sometimes you want to hide some data from external access. For example, maybe you have some logic you need to apply before touching your properties, or maybe you know that some methods need to be called in a certain way or order, and so shouldn’t be touched externally.

 We can demonstrate the problem with an example struct:
 
 */
struct BankAccount {
    var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

//But the funds property is just exposed to us externally, so what’s stopping us from touching it directly? The answer is nothing at all – this kind of code is allowed:
account.funds -= 1000

//That completely bypasses the logic we put in place to stop people taking out more money than they have, and now our program could behave in weird ways.

//To solve this, we can tell Swift that funds should be accessible only inside the struct – by methods that belong to the struct, as well as any computed properties, property observers, and so on.

//This takes only one extra word:
//    private var funds = 0

/*:
 
 Swift provides us with several options, but when you’re learning you’ll only a handful:

 -  Use ***private*** for “don’t let anything outside the struct use this.”
 -  Use ***fileprivate*** for “don’t let anything outside the current file use this.”
 -  Use ***public*** for “let anyone, anywhere use this.”
 -  ***Internal*** this is default for every thing if we not set access control
 
 */
public class SomePublicClass {                  // explicitly public class
    public var somePublicProperty = 0            // explicitly public class member
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

class SomeInternalClass {                       // implicitly internal class
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

fileprivate class SomeFilePrivateClass {        // explicitly file-private class
    func someFilePrivateMethod() {}              // implicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

private class SomePrivateClass {                // explicitly private class
    func somePrivateMethod() {}                  // implicitly private class member
}

//: [Next](@next)
