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
    @Published var searchData: Search?
    @Published var responseCode: Int = 0
    @Published var isLoading: Bool = false
    func fetchData(url: String){
        guard let url = URL(string: url) else {
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

            if let httpResponse = response as? HTTPURLResponse {
                DispatchQueue.main.async {
                    self.responseCode = httpResponse.statusCode
                }
            }

            guard let searchResults = try? JSONDecoder().decode(Search.self, from: data) else {
                print("Failed to Decode Data")
                return
            }
            DispatchQueue.main.async {
                self.searchData = searchResults
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                DispatchQueue.main.async {
                    self.responseCode = httpResponse.statusCode
                    self.isLoading = false
                }
            }
         //   print(self.responseCode)

          //  print(searchResults)
        }.resume()
    }
   
}
