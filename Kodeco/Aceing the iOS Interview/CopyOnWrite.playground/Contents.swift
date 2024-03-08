import Cocoa

var greeting = "Hello, playground"

let array1 = ["David", "Namrata", "Lea"]
var array2 = array1

print(array1)
print(array2)

// something interesting is happening under the good..
array2.append("Ray")

print(array1)
print(array2)

// It is common back in the day where you would be mutating array1
// Because the Swift array conforms to the Collection type
// When we mutate array2, that is a separate memory address
// When we assign to array2 the value of array1
// Copy-on-write

class List {
    var array: [String]
    
    init(_ array: [String]) {
        self.array = array
    }
}

let list1 = List(array1)
var list2 = list1

//print(list1.array)
//print(list2.array)

list2.array.append("Ray")


print(list1.array)
print(list2.array)

class Name {
    var value: String
    
    init(_ value: String) {
        self.value = value
    }
}

let name = Name("David")

struct Interview {
    var interviewer: Name
    
    init(_ interviewer: Name) {
        self.interviewer = interviewer
    }
    
    mutating public func changeName(to name: String) {
        let newName = Name(name)
        self.interviewer = newName
    }
}

let interview1 = Interview(.init("Namrata"))
var interview2 = interview1

//print(interview1.interviewer.value)
//print(interview2.interviewer.value)

interview2.changeName(to: "Lea")

print(interview1.interviewer.value)
print(interview2.interviewer.value)
