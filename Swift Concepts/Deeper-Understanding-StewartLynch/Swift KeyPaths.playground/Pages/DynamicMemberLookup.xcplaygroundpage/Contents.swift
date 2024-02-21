/*:
 [< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
 ## @dynamicMemberLookup
 - Callout(@dyNamicMemberLookup):A feature in Swift that allows you to access members of a type dynamically at runtime using a subscript syntax.
 ---
 */
import Foundation

struct Variety {
    let classification: String
    let type: WineType
    
    enum WineType: String {
        case red, white
    }
}

struct Winery {
    var name: String
    var country: String
}

struct Purchase {
    let winery: Winery
    let variety: Variety
    let qty: Int
}

let samplePurchase = Purchase(winery: Winery(name: "Road 13", country: "Canada"), variety: Variety(classification: "Chardonnay", type: .white), qty: 3)

code(for: "1. No KeyPaths") {
    // Print the name of the winery of the wine purchased
    print(samplePurchase.winery.name
    )
    
}

code(for: "2. With KeyPaths") {
    // Print the name of the winery of the wine purchased
    let wineryNameKeyPath = \Purchase.winery.name

}

code(for: "3. Static Type KeyPath") {
    // Create a static Purchase KeyPath to use to print the variety classification
   
}


code(for: "4. Dynamic Member Lookup 1") {
    // Use DynamicMemberLookups to print the sample purchase's winery's name and country
}

code(for: "5. Generic Dynamic Member Lookup") {
    // Use a generic DynamicMemberLookup to print the sample purchase's variety calssification and the type's raw value

}
/*:
 [< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
*/
