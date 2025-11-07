import UIKit

// Collections: Array, Set, and Dictionary.

// ARRAY

print("--ARRAY---")
print("""
These are the characterristics of an Array:
1. It is ordered
2. Supports duplicated items
3. Each item has a position (index) \n
""")

//Defining an empty array
var arrayName: [Int] = []

var gradesArray: [Int] = [100, 90, 80, 100, 60, 50]
var namesArray: [String] = ["Ken", "Fernanda", "Ivan", "Linda"]

// Printing the array using interpolation
print("This is an empty array: \(arrayName)")

// Print the array of names to verify the order

print("This is an Array of Integer values: \(gradesArray)")

// SET
print("---SET---")
print("""
1. It is unordered collection
2. Items dont have position (index)
3. Duplicates are not allowed
""")

var catgories = Set<String>() //Empty set
//var gender = Set<String> = ["Female", "Male"]

print("This is an empty set: \(catgories)")
print("This is a set of Strings: \(catgories)")

// Comparing arrays and sets

var grades1: [Double] = [69.00, 89.99, 57.96]
var grades2: Set<Double> = [69.00, 89.99, 57.96]

print("This is the grades array \(grades1) \n This is the set grades \(grades2)")

// Dictionary

print("---Dictionary---")
print("""
1. Unordered
2. Collection of key-value pairs
3. Each key must be unique, but the value can be duplicated
""")

// Defining a dictionary -> var dictionaryName: []

var movieRatings: [String: Int] = [:]

movieRatings["Pulp Fiction"] = 5
movieRatings["The Shawshank Redemption"] = 4
movieRatings["Inception"] = 5
movieRatings["The Dark Knight"] = 5

print("This is a dictionary of movies and their ratings: \(movieRatings)")

var studentGrades: [String: [Double]] = [:]

studentGrades["Ken"] = [80.0]
studentGrades["Fernanda"] = [80.0]
studentGrades["Ivan"] = [90.0]
studentGrades["Linda"] = [70.0]

print("This is a dictionary of students and their grades: \(studentGrades)")


// 1. Array

var studentNames = ["Linda", "Ramone", "Wendell","Linda"]

var studentRegistration: [Int: String] = [:]

studentRegistration[101] = "Ken"
studentRegistration[102] = "Fernanda"
studentRegistration[103] = "Ivan"
studentRegistration[104] = "Linda"

print("This is a dictionary of student registration numbers and their names: \(studentRegistration)")

// 2. Set<>

var studentIDs: Set<Int> = [101, 102, 103, 104]

print("This is a set of student registration numbers: \(studentIDs)")

// 3. Dictionary

var studentGrades1: [String: Int] = [:]

studentGrades1["Ken"] = 80
studentGrades1["Fernanda"] = 80
studentGrades1["Ivan"] = 90
studentGrades1["Linda"] = 70

print("The students grades are in the following format: Name: Grade (dictionary) \n \(studentGrades1)")


// 4. Arrary - Ordered, and supports dups. var arrayName: [Int] = []
var courseNames: [String] = ["Math", "Science", "History", "Geography"]

print("This is an array of course names: \(courseNames)")

// 1. Array, supports dups

var bookTitles: [String] = ["Book1", "Book2", "Book2", "Book3"]

print("This is an array of book titles: \(bookTitles)")

// 2. Set, does not support dups

var uniqueISBN: Set<String> = ["A101","B102","C103"]

print("This is an unique set: \(uniqueISBN)")



