/*:
 [< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
 ## Subscripts - The Basics
 - Callout(Subscript): A shortcut to accessing elements of a collection, list or sequence type, such as arrays and dictionaries, using square bracket notation ([]).
*/
import Foundation

code(for: "Arrays - [Int]") {
    // Consider this array
    var numbers = [1, 2, 3, 4, 5]
    // Use a subscript to access the 3rd element of the array
    let thirdNumber = numbers[2]
    // Change the 5th element of the array to 6
    print(thirdNumber)
    numbers[4] = 6
    print(numbers)

}
code(for: "Arrays - [Object]") {
    struct Person {
        var name: String
        var age: Int
    }
    var people = [
        Person(name: "Jenny", age: 18),
        Person(name: "Sam", age: 28),
        Person(name: "Julie", age: 21)
    ]
    
    // print the name of the second person
    print(people[1].name)
   
    // Change the name of the first person to Jennifer
    people[0].name = "Jennifer"
    print(people[0])
    
    // Loop through using an index to print out all first names
    
}

code(for: "Dictionaries") {
    // Consider this dictionary
    var ages = ["Alice": 25, "Bob": 30, "Charlie": 35]
    
    // print the age of Alice
    let aliceAge = ages["Alice"]
    print(aliceAge)
    print(ages["Stewart"] ?? "Unknown")
    // Set Bob's age to 31
    ages["Bob"] = 31
    print(ages["Bob"])

    // Loop through and print all ages
    
}
/*:
[< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
*/
