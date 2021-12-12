//: [Previous](@previous)

/*:
 
 # Functions Advanced Part 1
 
 ## 1:  How to return multiple values from functions
 
 - When you want to return a single value from a function, you write an arrow and a data type before your function’s opening brace, like this:
 
 */
func isUppercase(string: String) -> Bool {
    string == string.uppercased()
//    return string == string.uppercased()
}
/*:
 
 - If you want to return two or more values from a function, you could use an array. For example, here’s one that sends back a user’s details:
 
 */
func getUser1() -> [String] {
   
    ["Taylor", "Swift"]
}

let user1 = getUser1()
//print("Name: \(user1[0]) \(user1[1])")
/*:
 - That’s problematic, because it’s hard to remember what user[0] and user[1] are, and if we ever adjust the data in that array then user[0] and user[1] could end up being something else or perhaps not existing at all.

 ---
 
 - We could use a dictionary instead, but that has its own problems:
 
 */
func getUser2() -> [String: String] {
    [
        "firstName": "Taylor",
        "lastName": "Swift"
    ]
}

let user2 = getUser2()
print("Name: \(user2["firstName", default: "Anonymous"]) \(user2["lastName", default: "Anonymous"])")
/*:
 - Yes, we’ve now given meaningful names to the various parts of our user data, but look at that call to print() – even though we know both firstName and lastName will exist, we still need to provide default values just in case things aren’t what we expect.
 ---
  ### Both of these solutions are pretty bad, but Swift has a solution in the form of tuples. Like arrays, dictionaries, and sets, tuples let us put multiple pieces of data into a single variable, but unlike those other options tuples have a fixed size and can have a variety of data types.
 
 - Here’s how our function looks when it returns a tuple:
 
 */
func getUser() -> (firstName: String, lastName: String, age: Int) {
    //.....
    //,,,,,
//    return (firstName: "Taylor", lastName: "Swift", age: 15)
    ("Taylor", "Swift", 15)
    //return (firstName: "Taylor", lastName: "Swift", age: 15)
}

//func getUser() -> (String, String, Int) {
//    (firstName: "Taylor", lastName: "Swift", old: 15)
//}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")
print("Age: \(user.age)")
/*:
 
 ## 2:  How to customize parameter labels
 
 - Well, when we’re defining the parameters for a function we can actually add two names: one for use where the function is called, and one for use inside the function itself. hasPrefix() uses this to specify _ as the external name for its parameter, which is Swift’s way of saying “ignore this” and causes there to be no external label for that parameter.
 
 */
func isUppercase1(string: String) -> Bool {
    string == string.uppercased()
}

let string1 = "HELLO, WORLD"
let result1 = isUppercase1(string: string1)

/// -------------------

func isUppercase2(_ inName: String) -> Bool {
    inName == inName.uppercased()
}

let string2 = "HELLO, WORLD"
let result2 = isUppercase2(string2)

/// -------------------

// Here’s how that looks:

func printTimesTables(for number: Int) {
    for i in 1...10 {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(for: 5)
/*:
 
 - There are three things in there you need to look at closely:
 We write for number: Int: the external name is for, the internal name is number, and it’s of type Int.
 When we call the function we use the external name for the parameter: printTimesTables(for: 5).
 Inside the function we use the internal name for the parameter: print("\(i) x \(number) is \(i * number)").
 So, Swift gives us two important ways to control parameter names: we can use _ for the external parameter name so that it doesn’t get used, or add a second name there so that we have both external and internal parameter names.

 
 */


//: [Next](@next)
