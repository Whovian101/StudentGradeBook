//
//  ShoppingListView.swift
//  Project103-Ch4
//
//  Created by Linda Luna on 11/4/25.
//

import SwiftUI

struct ShoppingListView: View {
    
    // MARK: - State Variables
    @State private var shoppingList: [String] = ["Eggs", "Apples"] // Initial shopping items
    @State private var item: String = "" // Holds the new item input
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color.gray.opacity(0.2)
                    .ignoresSafeArea()
                
                VStack {
                    // Title
                    Text("Shopping List")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding()
                    
                    // MARK: - List of Items
                    List {
                        ForEach(shoppingList, id: \.self) { item in
                            Text(item)
                        }
                    }
                    
                    // MARK: - Input Field and Add Button
                    HStack {
                        // TextField for new item
                        TextField("Add new shopping item...", text: $item)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 1)
                                    .opacity(0.5)
                            )
                        
                        // Button to add item to the list
                        Button(action: {
                            if !item.isEmpty {
                                shoppingList.append(item)
                                item = "" // Clear input field
                            }
                        }) {
                            Image(systemName: "arrowshape.up.fill")
                                .padding()
                                .background(Color.blue.opacity(0.7))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                    .padding()
                }
            }
            // MARK: - Navigation Bar Title
            .navigationBarTitle("Listify", displayMode: .inline)
            // MARK: - Toolbar with Sorting Options
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        // Sort A → Z
                        Button("Sort A → Z") {
                            shoppingList.sort()
                        }
                        
                        // Sort Z → A
                        Button("Reversed Order") {
                            shoppingList.sort(by: >)
                        }
                    } label: {
                        Image(systemName: "arrow.up.arrow.down.circle")
                            .imageScale(.large)
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .padding()
                    }
                }
            }
        }
    }
}
// MARK: - Preview
#Preview {
    ShoppingListView()
}
