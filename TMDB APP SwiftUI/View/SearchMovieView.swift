//
//  ContentView.swift
//  TMDB APP SwiftUI
//
//  Created by Tanvir Rahman on 23.11.2023.
//

import SwiftUI


struct SearchMovieView: View {
    @State private var isLoading: Bool = false
    @StateObject var viewModel = SearchMovieViewModel()

    var body: some View {
        VStack {
            HStack {
                
                TextField("Search to see move...",text: .constant(""))
                    .onSubmit{
                        print("Searching...")
                    }
                    .submitLabel(.search)
                Button{
                    
                }label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                }
 
            }
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.secondary, lineWidth: 1)
                )

            ScrollView {
                if (viewModel.searchData?.results.count) ?? 0 >= 1 && viewModel.responseCode == 200{
                    LazyVStack {
                        ForEach(viewModel.searchData!.results, id: \.title) { data in
                            MovieCell(imageURL: data.poster_path ?? "", title: data.title ?? "", overview: data.overview ?? "", rating: String(data.vote_average ?? 0.0), isLoading: false)
                        }
                    }
                }else {
                    MovieCell(imageURL: "", title: ReductedData.original_title, overview: ReductedData.overview, rating: ReductedData.vote_average, isLoading: true)
                }
            }
        }
            .padding(10)
        .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
}

#Preview {
    SearchMovieView()
}

