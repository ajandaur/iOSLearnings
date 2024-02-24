/*:
 [< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
 ## Custom Subscripts
 In Swift, you can define a custom subscript for your own types, allowing you to provide a more convenient and intuitive way to access elements of your custom data structures.
*/
import Foundation

code(for: "The Matrix") {
   // consider this matrix or grid  it is an array of arrays
   let matrixExample = [
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0]
   ]
    
    // create a struct that will allow you to generate a similar matrix but for any number of rows and columns
    
    // create a matrix with 5 rows and 2 columns
    
    // set the value of the 4th row of the 2nd column to 5

}

code(for: "Create a custom subscript for the Matrix struct") {
    // copy your Matrix struct from the previous example and modify it
    
    // Create a 4 X 8 matrix

    // set the value of the 4th row of the 6th column to 5

}

code(for: "Safe Index Matrix") {
    // copy your Matrix struct from the previous example and modify it to prevent the retrieval of invalid indeces and test
    
}

code(for: "Make the Matrix Generic") {
    // copy your Matrix struct from the previous example and modify it to allow for the creation of a Matix of any type of object with any default value
    
}

code(for: "Additional Subscripts") {
    // copy your Matrix struct from the previous example and modify it by adding additonal subscripts to
    // 1. Retrieve a specific row of objects
    // 2. Retrieve a specific column of objects
    // 3. Retrieve a specific element of the matrix using non zero-based indeces
    // - Verify after each new subscript added

    
}
/*:
[< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
*/
