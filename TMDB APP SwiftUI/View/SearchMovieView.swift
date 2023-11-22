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
                
                TextField("Search move...",text: .constant(""))
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
                ForEach(0..<5) { _ in
                    MovieCell()
                }
            }
        }.redacted(reason: isLoading ? .placeholder : .invalidated)
        .padding()
        .onAppear{
            viewModel.fetchData(url: "https://api.themoviedb.org/3/search/movie?api_key=38e61227f85671163c275f9bd95a8803&query=Harry+Potter")
        }
    }
}

#Preview {
    SearchMovieView()
}

