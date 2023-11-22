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
    @State private var searchText: String = ""
    var body: some View {
        VStack {
            HStack {
                
                TextField("Search to see move...",text: $searchText)
                    .onSubmit{
                        viewModel.fetchData(url: "https://api.themoviedb.org/3/search/movie?api_key=38e61227f85671163c275f9bd95a8803&query=\(searchText.replacingOccurrences(of: "", with: "+"))")
                        viewModel.isLoading = true
                    }
                    .submitLabel(.search)
                Button{
                    viewModel.fetchData(url: "https://api.themoviedb.org/3/search/movie?api_key=38e61227f85671163c275f9bd95a8803&query=\(searchText.replacingOccurrences(of: "", with: "+"))")
                    viewModel.isLoading = true
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
            if viewModel.isLoading {
                ScrollView {
                    ForEach(0..<10){ _ in
                        MovieCell(imageURL: "", title: ReductedData.original_title, overview: ReductedData.overview, rating: ReductedData.vote_average, isLoading: viewModel.isLoading)
                    }
                }
            }else {
                ScrollView {
                    if (viewModel.searchData?.results.count) ?? 0 >= 1 && viewModel.responseCode == 200{
                        VStack {
                            ForEach(viewModel.searchData!.results, id: \.title) { data in
                                MovieCell(imageURL: data.poster_path ?? "", title: data.title ?? "", overview: data.overview ?? "", rating: String(data.vote_average ?? 0.0), isLoading: false)
                            }
                        }
                    }else if viewModel.responseCode != 200 && !isLoading && viewModel.responseCode != 0{
                        Text("Search Error")
                            .font(.largeTitle).foregroundColor(.primary)
                    }
                }
            }
        }.padding(10)
        .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear{
            viewModel.fetchData(url: "https://api.themoviedb.org/3/search/movie?api_key=38e61227f85671163c275f9bd95a8803&query=marvel")
            viewModel.isLoading = true
        }
    }
}

#Preview {
    SearchMovieView()
}

