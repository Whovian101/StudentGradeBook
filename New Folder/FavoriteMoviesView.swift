import SwiftUI

struct FavoritesMoviesView: View {
    @State private var movies: Set<String> = ["Doctor Who", "Tangled", "Demon Hunters"]
    @State private var newMovie = ""
    @State private var showAlert = false
    @State private var isSortedAscending = true // Track sort order

    var body: some View {
        NavigationView {
            // on the stack you can Opt+Cmd+Left or right to collapse/expand the code
            VStack {
                List(sortedMovies, id: \.self) { movie in
                    Text(movie)
                }
                
                HStack {
                    TextField("Add new movie...", text: $newMovie)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: addMovie) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                    .padding(.leading, 8)
                }
                .padding()
            }
            .navigationTitle("Favorite Movies")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: toggleSortOrder) {
                        Image(systemName: "arrow.up.arrow.down.circle")
                            .font(.title2)
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Duplicate Movie"),
                      message: Text("Movie already in the list!"),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
    
    var sortedMovies: [String] {
        isSortedAscending ? movies.sorted() : movies.sorted(by: >)
    }
    
    func addMovie() {
        let trimmed = newMovie.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        
        if movies.contains(trimmed) {
            showAlert = true
        } else {
            movies.insert(trimmed)
            newMovie = ""
        }
    }
    
    func toggleSortOrder() {
        isSortedAscending.toggle()
    }
}

struct FavoritesMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesMoviesView()
    }
}
