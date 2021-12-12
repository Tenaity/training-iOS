//: [Declarations](@previous)
/*:
 
 # Optionals
 
 Optionals are used in Swift where a variable's value may be absent (`nil`).
 
 **Either:**
 
 - there is a value, and you have to unwrap the optional
 - or, there is is no value at all
 
 The `Int()` initializer returns an `Int?` instead of `Int` because it might fail to convert the `String` to a numeric value.
 
 */
var twentyThree: Int? = Int("23") // -> 23
var five: Int! = Int("five")      // -> nil


/*:
 
 _An initializer is used to create an instance of a datatype (otherwise known as constructors in other languages)_
 
 ---
 
 ## nil
 
 In Swift, you can set an optional value to nil, but you cannot do this with non-optional values. By default optional variables are set to nil
 
 */
twentyThree = nil
var optionalValue: Int? // -> nil
/*:
 
 ---
 
 ## Unwrapping Optionals
 
 Unwrapping an optional means checking the value inside an optional variable. You can check if an optional has a value using an `if` statement (these are explained in [Conditional Statements](#Conditional%20Statements)) to check if the value is `nil`.
 
 You can then use the `!` operator to force unwrap the value contained in the optional. If you use the `!` you **must** be sure that the optional contains a non-nil value, otherwise your program will crash, and you will be unhappy.
 
 */
optionalValue = Int("23")

//if optionalValue != nil {
//    print("the optional has a value of \(optionalValue!)")
//} else {
//    print("gia tri khong ton tai")
//}
/*:
 
 ---
 
 ## Optional Binding
 
 Another way of checking if an optional has a non-nil value, is to use optional binding:
 
 */
if let value = optionalValue {
    print("the optional still has a value of \(value)")
}
/*:
 
 ---
 
 ## Implicitly Unwrapped Optionals
 
 As described above, optionals indicate that a constant or variable is allowed to have “no value”. Optionals can be checked with an if statement to see if a value exists, and can be conditionally unwrapped with optional binding to access the optional’s value if it does exist.

 Sometimes it’s clear from a program’s structure that an optional will always have a value, after that value is first set. In these cases, it’s useful to remove the need to check and unwrap the optional’s value every time it’s accessed, because it can be safely assumed to have a value all of the time.

 These kinds of optionals are defined as implicitly unwrapped optionals. You write an implicitly unwrapped optional by placing an exclamation point (String!) rather than a question mark (String?) after the type that you want to make optional. Rather than placing an exclamation point after the optional’s name when you use it, you place an exclamation point after the optional’s type when you declare it.

 Implicitly unwrapped optionals are useful when an optional’s value is confirmed to exist immediately after the optional is first defined and can definitely be assumed to exist at every point thereafter. The primary use of implicitly unwrapped optionals in Swift is during class initialization, as described in Unowned References and Implicitly Unwrapped Optional Properties.

 An implicitly unwrapped optional is a normal optional behind the scenes, but can also be used like a non-optional value, without the need to unwrap the optional value each time it’s accessed. The following example shows the difference in behavior between an optional string and an implicitly unwrapped optional string when accessing their wrapped value as an explicit
 
 */
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation point

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation point
/*:
 
 Read more about optionals in [The Basics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html) in the Swift Book.
 
 */
//: [Integers](@next)
