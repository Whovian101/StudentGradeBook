import UIKit

class Pet {
    // Attributes -> Data -> Variables or Constants
    var name: String
    var age: Int
    var owner: String
    
    // Initializer - Constructor
    init(name: String, age: Int, owner: String) {
        self.name = name
        self.age = age
        self.owner = owner
    }
    
    // Additional methods
    
    
}
//Creating an Object
let pet1 = Pet(name: "Fluffy", age: 3, owner: "Adam")

// Re-assign values
pet1.name = "Snowy"

// How to access to the properties of an Object?
print("Pet Name: \(pet1.name)")
