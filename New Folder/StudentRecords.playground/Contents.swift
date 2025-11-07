import Foundation

// ARRAY: A list that can contain duplicates and keeps order
// Used here to store student names
let studentNames = ["Alice", "Bob", "Charlie", "Diana", "Ethan"]

// DICTIONARY: A collection of key-value pairs
// Keys must be unique. Used here to map each student name to their grades
let studentGrades: [String: [Int]] = [
    "Alice": [85, 90, 78],
    "Bob": [92, 88, 95],
    "Charlie": [70, 75, 80],
    "Diana": [88, 84, 91],
    "Ethan": [95, 97, 93]
]

// SET (not used in this example)
// A Set is a collection of unique values, no duplicates allowed
// Example:
// let subjects: Set<String> = ["Math", "Science", "English", "Math"]
// This will automatically remove the duplicate "Math"

print("Student Record Summary:\n")

var highestAverage: Double = 0.0
var topStudent: String = ""

// Loop through each student using forEach (similar to a for loop)
studentNames.forEach { name in
    if let grades = studentGrades[name] {
        // Calculate average grade
        let average = Double(grades.reduce(0, +)) / Double(grades.count)
        
        // Print student info
        print("Student: \(name)")
        print("Grades: \(grades)")
        print(String(format: "Average: %.2f\n", average))
        
        // Check if this student has the highest average so far
        if average > highestAverage {
            highestAverage = average
            topStudent = name
        }
    } else {
        print("No grades found for student: \(name)\n")
    }
}

// Print the top student
print("Top Student: \(topStudent) with an average grade of \(String(format: "%.2f", highestAverage))")
