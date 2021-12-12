//: [Previous](@previous)

/*:
 
 # How to create and use enums
 
 An enum – short for enumeration – is a set of named values we can create and use in our code. They don’t have any special meaning to Swift, but they are more efficient and safer, so you’ll use them a lot in your code.
 
 */
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var weekday = Weekday.monday
print(weekday)

enum WeekString: String {
    case monday = "monday"
    case tuesday = "tuesday"
    case wednesday = "wednesday"
    case thursday = "thursday"
    case friday = "friday"
    case saturday = "saturday"
    case sunday = "sunday"
}

var weekString = WeekString.monday
weekString = WeekString(rawValue: "friday") ?? .monday
print(weekString.rawValue)

enum WeekInt: Int {
    case monday = 1
    case tuesday = 2
    case wednesday = 3
    case thursday = 4
    case friday = 5
    case saturday = 6
    case sunday = 7
}

var weekInt = WeekInt.monday
//weekInt = WeekInt.init(rawValue: 5) ?? .monday
print(weekInt.rawValue)

/*:
 
 */

//: [Next](@next)
