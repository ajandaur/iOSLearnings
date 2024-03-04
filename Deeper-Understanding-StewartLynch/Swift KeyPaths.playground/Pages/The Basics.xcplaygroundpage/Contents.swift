/*:
 [< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
 ## The Basics
 - Callout(KeyPath):a type-safe reference to a property of an object or a struct.
 ---
 */
import Foundation

struct Wine {
    var winery: String
    var variety: String
    var vintage: Int
    var price: Double
}
var favWine = Wine(winery: "Meyer Family Vineyards", variety: "Chardonnay", vintage: 2021, price: 31.25)

let wines = [
    Wine(winery: "Road 13", variety: "Pinot Gris", vintage: 2020, price: 18.50),
    Wine(winery: "Morraine", variety: "White Blend", vintage: 2021, price: 16.50),
    Wine(winery: "Meyer Family Vineyards", variety: "Chardonnay", vintage: 2021, price: 31.25)
]

code(for: "1. Accessing property values") {
    let wineryKeyPath = \Wine.winery
//    print(favWine[keyPath: wineryKeyPath])
    print(favWine[keyPath: \.winery])
}

code(for: "2. Update a property using a KeyPath") {
//    let priceKeyPath = \Wine.price
//    favWine[keyPath: priceKeyPath] = 35.00
//    print(favWine[keyPath: priceKeyPath])
    favWine[keyPath: \.price] = 35.00
    print(favWine[keyPath: \.price])
    
}
code(for: "3. Sort Wines by winery") {
//    let sortedByWinery = wines.sorted { win1, win2 in
//        win1.winery < win2.winery
//    }
    
    let sortedByWinery = wines.sorted(using: KeyPathComparator(\.winery))
    for wine in wines {
        print(wine.winery)
    }
}

code(for: "4. Sort Wines by price Descending") {
    let sortedByPrice = wines.sorted(using: KeyPathComparator(\.price, order: .reverse))
    for wine in wines {
        print(wine.variety, wine.price)
    }
}

code(for: "5. Mapping using KeyPaths") {
    let varieties = wines.map { $0.variety }
}
/*:
 [< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
*/
