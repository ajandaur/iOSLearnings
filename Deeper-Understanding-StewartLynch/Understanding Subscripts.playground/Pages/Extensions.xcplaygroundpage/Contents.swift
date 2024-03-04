/*:
 [< Previous](@previous)                    [Home](Introduction)
 ## Extensions
 Writing extensions to some Swift types to create a subscript can make our code easier to deal with and safer.
 */

import Foundation


code(for: "String.Index") {
    // Consider this string
    var str = "hel⭐️lo"
    // print out the ⭐️ character using the string's index
    
    // change the star to a ❤️ using the index
    
}

code(for: "String Extension") {
    // 1. Use the space above this code block to write an subscript extension for String
    // 2. Use the extension to print the 4th character of the following string as a String
    var str = "hel⭐️lo"
    
    // replace the 5th character of the sample string with a ❤️
    
    
}

code(for: "Safe Array Index") {
   // consider this array
    let numbers = [1,2,3,4]
    // 1. Use the space above this code block to write an extension for Array that will be a safe replacement for the array index to retrurn an optional value or nil if the index is out of range
    // 2. Verify by printing a valid and invalid index

}
/*:
[< Previous](@previous)                    [Home](Introduction)
*/
