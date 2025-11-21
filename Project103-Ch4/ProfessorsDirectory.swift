//
//  ProfessorsDirectory.swift
//  Project103-Ch4
//
import SwiftUI

// MARK: - Model
class Professor: Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    var phoneNumber: String
    
    init(firstName: String, lastName: String, phoneNumber: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }
}

// MARK: - Main View
struct ProfessorsListView: View {
    @State private var professors: [Professor] = [
        Professor(firstName: "Alex", lastName: "Dyous", phoneNumber: "111-222-3333"),
        Professor(firstName: "Ivan", lastName: "English", phoneNumber: "222-333-4444"),
        Professor(firstName: "Kenny", lastName: "Gonzalez", phoneNumber: "333-444-5555"),
        Professor(firstName: "Ramone", lastName: "Hayes", phoneNumber: "444-555-6666"),
        Professor(firstName: "Linda", lastName: "Luna", phoneNumber: "555-666-7777"),
        Professor(firstName: "Wendell", lastName: "Richards", phoneNumber: "666-777-8888")
    ]
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var phoneNumber: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Text("Professors Directory")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                
                // Input Fields
                VStack(spacing: 10) {
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Phone Number", text: $phoneNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.phonePad)
                    
                    Button(action: addProfessor) {
                        Label("Add Student", systemImage: "plus.circle.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                }
                .padding(.horizontal)
                
                Divider()
                
                // Professors List
                List(professors) { professor in
                    VStack(alignment: .leading) {
                        Text("\(professor.firstName) \(professor.lastName)")
                            .font(.headline)
                        Text("Phone: \(professor.phoneNumber)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Directory")
        }
    }
    
    func addProfessor() {
        guard !firstName.isEmpty, !lastName.isEmpty, !phoneNumber.isEmpty else { return }
        
        let newProfessor = Professor(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber)
        professors.append(newProfessor)
        
        firstName = ""
        lastName = ""
        phoneNumber = ""
    }
}

// MARK: - Preview
#Preview {
    ProfessorsListView()
}
