//
//  MovieCelll.swift
//  TMDB APP SwiftUI
//
//  Created by Tanvir Rahman on 23.11.2023.
//

import SwiftUI

struct MovieCell: View {
    @StateObject var lazyImage = lazyImageAndCache()
    var imageURL: String?
    var title: String
    var overview: String
    var rating: String
    var isLoading: Bool
    var body: some View {
        HStack(alignment: .top){
            lazyImage.lazyImage(url: "https://image.tmdb.org/t/p/w220_and_h330_face\(imageURL ?? "")")
                .resizable()
                    .frame(width: 100, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(alignment: .leading){
                    Text(title)
                        .fontWeight(.medium)
                    Text(overview)
                    Text("Rating: \(rating)")
                        .italic()
                }
                
                Spacer()
            }.padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.secondary, lineWidth: 1)
                )
                .padding(5)
                .redacted(reason: isLoading ? .placeholder : .invalidated)
        }
}

#Preview {
    MovieCell(imageURL: "", title: "", overview: "", rating: "", isLoading: false)
}
