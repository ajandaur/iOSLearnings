/*:
 [< Previous](@previous)           [Home](Introduction)

 ## Practical Uses
*/
import Foundation

// This function is used for example 1 below
func countryInfo(name: String, population: Int, states: Int) {
    print("\(name) has \(population) people in \(states) states.")
}

// This dictionary is used for examples 2, 3 and 4 below
let countryDictionary: [String: Int] = [
    "Canada" : 37_000_000,
    "United States" : 332_278_000,
    "United Kingdom" : 67_886_000,
    "Japan" : 125_440_000,
    "Germany" : 83_190_000,
]

code(for: "1. Parameters in Functions") {
    // convert the countryInfo array in to one that will use a tuple for a parameter
    func countryInfo(_ country: (name: String, population: Int, states: Int)) {
        print("\(country.name) has \(country.population) people in \(country.states) states.")
    }
    countryInfo((name: "Canada", population: 37_000_000, states: 10))
}

code(for: "2. Returning Tuples") {
    // use the CountryDictionary to create a function that will return a tuple when provided the name of the country
    func countryInfo(_ name String) -> (name: String, population: Int?) {
        return (name: name, population: countryDictionary[name])
    }

}

code(for: "3. TypeAleas") {
    // use a typeAlias to recreate the countryInfo function
    typealias countryData = (name: String, population: String)
    func countryInfo(_ name String) -> countryData {
        return (name: name, population: countryDictionary[name])
    }
    print(countryInfo("Canada"))
    let us = countryInfo("United States")
    print(us.population ?? "unknown")
}

code(for: "4. Covert Dictionary to Array of tuples") {
    // Map the CountryDictionary into an array of tuples
    let countryArray = countryDictionary.map {(name: $0, population: $1)}
    for country in countryArray {
        print(country.name)
    }

}

code(for: "5. Sorting with Tuples") {
    // see also https://youtu.be/4ochXtdrd70
    // Use the Wine model and the allWines static array (found in the Sources folder for the playground)
    // To sort wines using multiple criteria

}
/*:

 [< Previous](@previous)           [Home](Introduction)
 */
