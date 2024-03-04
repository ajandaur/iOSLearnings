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
    struct Matrix {
        var grid: [[Int]]
        init(rows: Int, cols: Int) {
            let row = Array(repeating: 0, count: cols)
            grid = Array(repeating: row, count: rows)
        }
    }
    
    // create a matrix with 5 rows and 2 columns
    var matrix = Matrix(rows: 5, cols: 2)
    print(matrix.grid)
    
    // set the value of the 4th row of the 2nd column to 5
    matrix.grid[3][1] = 5
    print(matrix.grid)
    

}

code(for: "Create a custom subscript for the Matrix struct") {
    // copy your Matrix struct from the previous example and modify it
    struct Matrix {
        var grid: [[Int]]
        init(rows: Int, cols: Int) {
            let row = Array(repeating: 0, count: cols)
            grid = Array(repeating: row, count: rows)
        }
        subscript(row: Int, col: Int) -> Int {
            get {
                return grid[row][col]
            }
            set(newValue) {
                grid[row][col] = newValue
            }
        }
    }
    
    // Create a 4 X 8 matrix
    var matrix = Matrix(rows: 4, cols: 8)

    // set the value of the 4th row of the 6th column to 5
    matrix[3, 5] = 5
    print(matrix.grid)
}

code(for: "Safe Index Matrix") {
    // copy your Matrix struct from the previous example and modify it to prevent the retrieval of invalid indeces and test
    struct Matrix {
        var grid: [[Int]]
        var rows: Int
        var cols: Int
        init(rows: Int, cols: Int) {
            self.rows = rows
            self.cols = cols
            let row = Array(repeating: 0, count: cols)
            grid = Array(repeating: row, count: rows)
        }
        subscript(row: Int, col: Int) -> Int? {
            get {
                guard row >= 0, row <= rows - 1, col >= 0, col <= cols - 1 else {
                    return nil
                }
                return grid[row][col]
            }
            set(newValue) {
                grid[row][col] = newValue!
            }
        }
    }
    var matrix = Matrix(rows: 4, cols: 5)
    print(matrix[3, 4] ?? -1)
    print(matrix[4, 1] ?? -1)
}

code(for: "Make the Matrix Generic") {
    // copy your Matrix struct from the previous example and modify it to allow for the creation of a Matix of any type of object with any default value
    struct Matrix<T> {
        var grid: [[T]]
        var rows: Int
        var cols: Int
        init(rows: Int, cols: Int, defualtValue: T) {
            self.rows = rows
            self.cols = cols
            let row = Array(repeating: 0, count: cols)
            grid = Array(repeating: row, count: rows)
        }
        subscript(row: Int, col: Int) -> T? {
            get {
                guard row >= 0, row <= rows - 1, col >= 0, col <= cols - 1 else {
                    return nil
                }
                return grid[row][col]
            }
            set(newValue) {
                grid[row][col] = newValue!
            }
        }
    }
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
