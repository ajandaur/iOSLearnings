/*:
 [< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
 ## Introduction to Initializes
 An Initializer is a special method that prepares an instance of a class, struct, or enum for use by setting its initial values
*/
import Foundation

code(for: "Initialize instances of a Person Struct") {
    // Consider this struct
    struct Person {
        var name: String
        var age: Int
        var numChildren: Int?
        var married = false
    }
    // Create a default person
    let p1 = Person(name: "Aidan", age: 30)
    
    // Create a person who has children AND is married
    let p2 = Person(name: "Billy", age: 56, numChildren: 2, married: true)
    
    
    // Create a person who has children and not married
    
    // Create a person who has no children but married
    
    
    
}
code(for: "Rewrite the Person Struct as a Class") {
    class Person {
        var name: String
        var age: Int
        var numChildren: Int?
        var married = false
    }
    
    // Create a default person
   
    
    // Create a person who has children AND is married
    
    
}
code(for: "Rewite the class with flexible initializer") {
    
    // Create a person who has children and not married
   
}

/*:
[< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
*/
