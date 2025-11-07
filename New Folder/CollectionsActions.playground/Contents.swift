import UIKit

// CLASS: Collections in Swift - Actions  we can perform with an Array, Set, and Dictionary

//------------------ ctr cmd space
// 1️⃣ CREATE / INITIALIZE
//------------------

var fruitsArray: [String] = ["Banana", "Apple", "Orange"]
var fruitsSet: Set<String> = ["Banana", "Apple", "Orange"]
var frutisDictionary: [String: String] = ["Yellow": "Banana", "Red": "Apple", "Orange": "Orange"]

print("\n---Creation---")
print("Array: \(fruitsArray)")
print("Set: \(fruitsSet)")
print("Dictionary: \(frutisDictionary)")


//------------------
// 2️⃣ ADD ELEMENTS
//------------------
print("\n---Add Elements---")

fruitsArray.append("Mango")
fruitsSet.insert("Mango")
frutisDictionary["Green"] = "Mango"

print("Array: \(fruitsArray)")
print("Set: \(fruitsSet)")
print("Dictionary: \(frutisDictionary)")

//------------------
// 3️⃣ REMOVE ELEMENTS
//------------------

print("\n---Remove Elements---")

fruitsArray.remove(at: 0)
fruitsSet.remove("Banana")
frutisDictionary.removeValue(forKey: "Yellow")

print("Array: \(fruitsArray)")
print("Set: \(fruitsSet)")
print("Dictionary: \(frutisDictionary)")


//------------------
// 4️⃣ SEARCH / CHECK ELEMENT
//------------------

print("\n---Searching---")

// Activity: Ask Google -> Swift find item in an Array
print("Array contains Apple? -> \(fruitsArray.contains("Apple"))")
print("Set contains Apple? -> \(fruitsSet.contains("Apple"))")
print("Dictionary contains Apple? -> \(frutisDictionary.keys.contains("Red"))")


//------------------
// 5️⃣ ITERATE / TRAVEL
//------------------

print("\n---Iterate---")

print("Array:")
for fruit in fruitsArray {
    print(fruit)
}

print("\nSet:")
for fruit in fruitsSet {
    print(fruit)
}

print("\nDictionary:")
for (color, fruit) in frutisDictionary {
    print(fruit)
}

//------------------
// 6️⃣ SORTING
//------------------
print("\n---Sorting---")
print("Array sorted ascending: ", fruitsArray.sorted(by: <))
//print("Array sorted decending: ", fruitsArray.sorted(by: >))
print("Set sorted ascending: ", fruitsSet.sorted())

let sortedFruitsDictionary = frutisDictionary.sorted {$0.value < $1.value }
print("Dictionary sorted: ", sortedFruitsDictionary)
