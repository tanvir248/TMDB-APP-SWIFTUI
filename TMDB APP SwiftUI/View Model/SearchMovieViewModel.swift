//
//  SearchMovieViewModel.swift
//  TMDB APP SwiftUI
//
//  Created by Tanvir Rahman on 23.11.2023.
//

import Foundation
enum errorSearch: Error {
    case invalidURL
    
}

class SearchMovieViewModel: ObservableObject {
    @Published var searchData: [Search] = []
    
    func fetchData(url: String){
        guard let url = URL(string: "www.www.com") else {
                    print("URL Error")
                  return
              }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data, error == nil else {
                print("Data Error: No Data found!!")
                return
            }
            guard let searchResults = try? JSONDecoder().decode(Search.self, from: data) else {
                print("Failed to Decode Data")
                return
            }
            print(searchResults)
        }.resume()
    }
   
}
