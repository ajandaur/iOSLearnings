
// Given an array, return 3 largest numbers of asc order

func threeLargestNumbers(array: [Int]) -> [Int] {
    if array.isEmpty {
        return []
    }
    
    var result = Array(repeating: Int.min, count: 3)
    
    // how to put values such that we account for sorting..
    for num in array {
        rearrange(number: num, result: &result)
    }
    
    
    return result
}

func rearrange(number: Int, result: inout [Int]) {
    // Determine largest number valid criteria
    var toBeInsertedIdx = -1
    if number > result[2] {
        toBeInsertedIdx = 2
    } else if number > result[1] {
        toBeInsertedIdx = 1
    } else if number > result[0] {
        toBeInsertedIdx = 0
    } else {
        return
    }
    
    // Shifting results backwards
    var currentIdx = toBeInsertedIdx
    while currentIdx > 0 {
        let temp = result[currentIdx - 1]
        result[currentIdx - 1] = result[toBeInsertedIdx]
        currentIdx -= 1
        result[toBeInsertedIdx] = temp
    }
    result[toBeInsertedIdx] = number
}
// Time: O(n) where n is input
// Space: 

let testCaseArray = [8, 112, 12, 1, 2, 3, 4, 5, 6, 7]
let result = threeLargestNumbers(array: testCaseArray)
print(result)
