import Foundation

//: [Previous](@previous)

/*:
 
 # Functions Advanced Part 2
 
 ## 1:  How to provide default values for parameters
 
 - Adding parameters to functions lets us add customization points, so that functions can operate on different data depending on our needs. Sometimes we want to make these customization points available to keep our code flexible, but other times you don’t want to think about it – you want the same thing nine times out of ten.
 
 For example, previously we looked at this function:
 

 */
// with-out default value for parameter

func printTimesTables1(for number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}
//printTimesTables1(for: 5, end: 20)
/*:
 
 */
// with default value for parameter

func printTimesTables2(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

//printTimesTables2(for: 5, end: 20)
//printTimesTables2(for: 8)
/*:
 
 ## 2:  How to handle errors in functions
 
 */
enum PasswordError: Error {
    case short, invalid
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.invalid
    }

    if password.contains("%") {
        throw NSError(domain: "local error", code: 99, userInfo: ["error": "special error"])
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "123456789%"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}



let string2 = "123456789%"

do {
    let result = try checkPassword(string2)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.invalid {
    print("I have the same combination on my luggage!")
} catch { error
    print("There was an error.")
    print(error)
}

/*:
 
 - Throwing functions in Swift are those that are able to encounter errors they are unable or unwilling to handle. That doesn’t mean they will throw errors, just that it’s possible they can. As a result, Swift will make sure we’re careful when we use them, so that any errors that do occur are catered for.
 
 But when you’re writing your code, chances are you’ll think to yourself “should this function throw any errors it encounters, or should it maybe handle them itself?” This is really common, and to be honest there is no single answer – you can handle the errors inside the function (thus making it not a throwing function), you can send them all back to whatever called the function (called “error propagation” or sometimes “bubbling up errors”), and you can even handle some errors in the function and send some back. All of those are valid solutions, and you will use all of them at some point.

 When you’re just getting started, I would recommend you avoid throwing functions most of the time. They can feel a bit clumsy at first because you need to make sure all the errors are handled wherever you use the function, so it feels almost a bit “infectious” – suddenly you have errors needing to be handled in several places in your code, and if those errors bubble up further then the “infection” just spreads.

 So, when you’re learning start small: keep the number of throwing functions low, and work outwards from there. Over time you’ll get a get better grip on managing errors to keep your program flow smooth, and you’ll feel more confident about adding throwing functions.


 
 
 */

//: [Next](@next)
