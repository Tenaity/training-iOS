//: [Previous](@previous)

import Foundation

/*:
 
 # Subscripts
 
 -  Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence. You use subscripts to set and retrieve values by index without needing separate methods for setting and retrieval. For example, you access elements in an Array instance as someArray[index] and elements in a Dictionary instance as someDictionary[key].

 -  You can define multiple subscripts for a single type, and the appropriate subscript overload to use is selected based on the type of index value you pass to the subscript. Subscripts aren’t limited to a single dimension, and you can define subscripts with multiple input parameters to suit your custom type’s needs.
 
 ## Subscript Syntax
Subscripts enable you to query instances of a type by writing one or more values in square brackets after the instance name. Their syntax is similar to both instance method syntax and computed property syntax. You write subscript definitions with the subscript keyword, and specify one or more input parameters and a return type, in the same way as instance methods. Unlike instance methods, subscripts can be read-write or read-only. This behavior is communicated by a getter and setter in the same way as for computed properties:
 
 */
var numberOfLegsArray = [1, 2, 3, 4]
numberOfLegsArray[1] = 2

var numberOfLegsDict = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegsDict["bird"] = 2


//subscript(index: Int) -> Int {
//    get {
//        // Return an appropriate subscript value here.
//    }
//    set(newValue) {
//        // Perform a suitable setting action here.
//    }
//}
//
//subscript(index: Int) -> Int {
//    // Return an appropriate subscript value here.
//}

/*:

 ## Subscript Usage
 The exact meaning of “subscript” depends on the context in which it’s used. Subscripts are typically used as a shortcut for accessing the member elements in a collection, list, or sequence. You are free to implement subscripts in the most appropriate way for your particular class or structure’s functionality.

 For example, Swift’s Dictionary type implements a subscript to set and retrieve the values stored in a Dictionary instance. You can set a value in a dictionary by providing a key of the dictionary’s key type within subscript brackets, and assigning a value of the dictionary’s value type to the subscript:

 */

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
/*:
 //: ![](subscriptMatrix01_2x.png)
 
 */
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
/*:
 
 //: ![](subscriptMatrix02_2x.png)
 
 */

//: [Next](@next)
