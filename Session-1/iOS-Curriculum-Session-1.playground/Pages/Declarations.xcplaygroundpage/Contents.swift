//: [Datatypes](@previous)
/*:
 
 # Declaring Constants and Variables
 
 In order to create a datatype we must declare it. If we don't declare it and try to use it, Xcode will complain telling you **Use of unresolved identifier 'x'** (where x is the variable name).
 
 _This — by the way — is called a compilation error._
 
 In order to avoid this error, we have two ways of declaring a variable:
 
 1. `let` (constant)
 2. `var` (variable)
 
 Constants and variables must be declared before they’re used. You declare constants with the let keyword and variables with the var keyword. Here’s an example of how constants and variables can be used to track the number of login attempts a user has made:
 
 */
let maximumNumberOfLoginAttempts = 10
//print(maximumNumberOfLoginAttempts)
//maximumNumberOfLoginAttempts = 20

var currentLoginAttempt = 0
currentLoginAttempt = 20
//print(currentLoginAttempt)
/*:
 
 This code can be read as:

 “Declare a new constant called maximumNumberOfLoginAttempts, and give it a value of 10. Then, declare a new variable called currentLoginAttempt, and give it an initial value of 0.”

 In this example, the maximum number of allowed login attempts is declared as a constant, because the maximum value never changes. The current login attempt counter is declared as a variable, because this value must be incremented after each failed login attempt.
 
 
 
 
 ## You can declare multiple constants or multiple variables on a single line, separated by commas:
 */
 var x = 0.0, y = 0.0, z = 0.0
var x1 = 0
var x2 = 1
/*:
 
 ## Using `Type Annotations`

 */
var welcomeMessage: String = "Hello"
//welcomeMessage = 10
var age: Int = 20
var name: String = "Tony"
print("age \(age) + name \(name)")
/*:
 
 You can provide a type annotation when you declare a constant or variable, to be clear about the kind of values the constant or variable can store. Write a type annotation by placing a colon after the constant or variable name, followed by a space, followed by the name of the type to use.
 
 ---
 
 ## Using `Comments`
 
 Use comments to include nonexecutable text in your code, as a note or reminder to yourself. Comments are ignored by the Swift compiler when your code is compiled.
 
 */
// This is a comment.

/* This is also a comment
but is written over multiple lines. */

/* This is the start of the first multiline comment.
 /* This is the second, nested multiline comment. */
This is the end of the first multiline comment. */

/*:
 
 ---
 
 ## Using `Semicolons`
 
 Unlike many other languages, Swift doesn’t require you to write a semicolon (;) after each statement in your code, although you can do so if you wish. However, semicolons are required if you want to write multiple separate statements on a single line:

 */
let cat = "🐱"; print(cat); var dog = "dog"
// Prints "🐱"
/*:
 
 ---
 
 ## Tuples
 Tuples group multiple values into a single compound value. The values within a tuple can be of any type and don’t have to be of the same type as each other.

 In this example, (404, "Not Found") is a tuple that describes an HTTP status code. An HTTP status code is a special value returned by a web server whenever you request a web page. A status code of 404 Not Found is returned if you request a webpage that doesn’t exist.

 */
let http404Error = (404, "Not Found")
//print(http404Error.1)
// http404Error is of type (Int, String), and equals (404, "Not Found")
/*:
 
The (404, "Not Found") tuple groups together an Int and a String to give the HTTP status code two separate values: a number and a human-readable description. It can be described as “a tuple of type (Int, String)”.

You can create tuples from any permutation of types, and they can contain as many different types as you like. There’s nothing stopping you from having a tuple of type (Int, Int, Int), or (String, Bool), or indeed any other permutation you require.

You can decompose a tuple’s contents into separate constants or variables, which you then access as usual:
 */
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"
/*:
 
If you only need some of the tuple’s values, ignore parts of the tuple with an underscore (_) when you decompose the tuple:

 */
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// Prints "The status code is 404"
/*:
 
Alternatively, access the individual element values in a tuple using index numbers starting at zero:
 */
print("The status code is \(http404Error.0)")
// Prints "The status code is 404"
print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found"
/*:
 
You can name the individual elements in a tuple when the tuple is defined:

 */
let http200Status = (statusCode: 200, description: "OK")
//If you name the elements in a tuple, you can use the element names to access the values of those elements:

print("The status code is \(http200Status.statusCode)")
// Prints "The status code is 200"
print("The status message is \(http200Status.description)")
// Prints "The status message is OK"

/*:
 
 Read more about declarations in [The Basics](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html) in the Swift Book.
 */

//: [Optionals](@next)
