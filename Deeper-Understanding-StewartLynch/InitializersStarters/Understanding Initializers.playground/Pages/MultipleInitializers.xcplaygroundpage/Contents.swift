/*:
 [< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
 ## Multiple initializers
 Classes and Structs can have many initializers
*/
import Foundation

code(for: "Multiple Initializers for struct") {
    struct Person {
        var name: String
        var age: Int
        var numChildren: Int?
        var married = false
        // Initializer to specify name, age and marital status
        
        
        // initializer for all 4 properties
        
        
        // initializer for name and age only with default nil for children and marital status false
        
        
        // initializer for name, age and number of children, with default marriage status
        
        
        // Initializer like the memberwise one.
        
    }
    
    // Create people using each instance
   
    
    // Create an array of 3 people using different intiailziers
    
}
/*:
[< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
*/
