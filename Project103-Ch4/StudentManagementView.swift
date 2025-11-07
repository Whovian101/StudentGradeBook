import SwiftUI

// Created unique identifer so it can distinguish between same names, name, grades
struct Student: Identifiable {
    let id = UUID()
    var name: String
    var grades: [Double]
    
    // Read that guard is better than if statement for better readability and identations
    
    var average: Double {
        guard !grades.isEmpty else { return 0.0 }
        return grades.reduce(0.0, +) / Double(grades.count)
    }
}


// Main view/ body

struct StudentManagementView: View {
    
    @State private var students: [Student] = [
        Student(name: "Adam", grades: [85, 90, 78]),
        Student(name: "Phuong", grades: [92, 88, 95]),
        Student(name: "Tina", grades: [76, 82, 89]),
        Student(name: "Thai", grades: [78, 84, 90])
    ]
    
    @State private var sortAscending: Bool = true
    @State private var newName: String = ""
    @State private var newGrades: String = "" // Comma-separated grades
    
    var courseAverage: Double {
        let allGrades = students.flatMap { $0.grades }
        guard !allGrades.isEmpty else { return 0.0 }
        return allGrades.reduce(0.0, +) / Double(allGrades.count)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.2).ignoresSafeArea() // Outer background
                
                VStack {
                    // White content area fills most of the screen
                    VStack(spacing: 20) {
                        
                        // Title
                        Text("Student Grades")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                        
                        // Average Grade
                        Text("Average Grade: \(String(format: "%.1f", courseAverage))")
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                        // Student List
                        ScrollView {
                            VStack(spacing: 12) {
                                ForEach(sortedStudents) { student in
                                    HStack {
                                        Text(student.name)
                                            .font(.body)
                                        Spacer()
                                        Text("\(String(format: "%.2f", student.average))")
                                            .font(.body)
                                            .foregroundColor(.black)
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                }
                            }
                        }
                        
                        // Add Student Section (Vertical)
                        VStack(spacing: 10) {
                            TextField("Student Name", text: $newName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            TextField("Grades (comma separated)", text: $newGrades)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numbersAndPunctuation)
                            
                            Button(action: addStudent) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.bottom)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                }
                .padding()
            }
            .navigationBarTitle("GradeBook", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        sortAscending.toggle()
                    }) {
                        Image(systemName: "arrow.up.arrow.down.circle")
                            .imageScale(.large)
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
    
    var sortedStudents: [Student] {
        students.sorted {
            sortAscending ? $0.average < $1.average : $0.average > $1.average
        }
    }
    
    func addStudent() {
        let gradeValues = newGrades
            .split(separator: ",")
            .compactMap { Double($0.trimmingCharacters(in: .whitespaces)) }
        
        guard !newName.isEmpty, !gradeValues.isEmpty else { return }
        
        let newStudent = Student(name: newName, grades: gradeValues)
        students.append(newStudent)
        newName = ""
        newGrades = ""
    }
}

#Preview {
    StudentManagementView()
}
