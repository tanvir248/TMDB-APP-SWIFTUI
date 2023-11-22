//
//  SearchMovieModel.swift
//  TMDB APP SwiftUI
//
//  Created by Tanvir Rahman on 23.11.2023.
//

import Foundation

struct Search: Codable {
    let page: Int?
    let results: [MovieDetails]
    let total_pages: Int?
    let total_results: Int?
}
struct MovieDetails: Codable {
    let adult: Bool?
    let original_title: String?
    let overview: String?
    let poster_path: String?
    let title: String?
    let vote_average: Double?
}
