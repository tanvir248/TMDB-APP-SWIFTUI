//
//  ContentView.swift
//  TMDB APP SwiftUI
//
//  Created by Tanvir Rahman on 23.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading: Bool = false
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
              Text("Scroll")
            }
        }.redacted(reason: isLoading ? .placeholder : .invalidated)
        .padding()
    }
}

#Preview {
    ContentView()
}

