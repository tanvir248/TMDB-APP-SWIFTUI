//
//  MovieCelll.swift
//  TMDB APP SwiftUI
//
//  Created by Tanvir Rahman on 23.11.2023.
//

import SwiftUI

struct MovieCell: View {
    @StateObject var lazy = imageVC()
    var body: some View {
        HStack(alignment: .top){
            lazy.lazyImage(url: URL(string: "https://image.tmdb.org/t/p/w220_and_h330_face/hziiv14OpD73u9gAak4XDDfBKa2.jpg")!, placeholder: "image")
                .resizable()
                    .frame(width: 100, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                VStack(alignment: .leading){
                    Text("Harry Potter")
                        .fontWeight(.medium)
                    Text("BBC docuemntary about Daniel Radcliffe and his role as the main character in Harry potter")
                    Text("Rating: 7.8")
                        .italic()
                }
                
                Spacer()
            }.padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.secondary, lineWidth: 1)
                )
                .padding(5)
        }
}

#Preview {
    MovieCell()
}
