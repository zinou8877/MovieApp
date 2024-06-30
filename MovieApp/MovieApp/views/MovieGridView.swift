//
//  MovieGridView.swift
//  MovieApp
//
//  Created by zz on 29/6/2024.
//

import SwiftUI

struct MovieGridView : View {
    var movie : Movie
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)" ))
                                { phase in
                                    switch phase {
                                    case .failure: Image(systemName: "photo") .font(.largeTitle)
                                    case .success(let image):
                                        image.resizable()
                                    default: ProgressView()
                                        
                                    }
                                }
                                .frame(width: 120, height: 140)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .scaledToFit()
                                
            VStack{
                Text(movie.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.label))
                    .minimumScaleFactor(0.6)
                    .padding(10)
                
                Text(movie.releaseDate)
                    .font(.body)
                    
                    .foregroundColor(Color(.label))
                    .minimumScaleFactor(0.6)
                    .padding(10)
            }
            
           
        }
    }
}

struct MovieGridView_previw: PreviewProvider {
    static var previews: some View {
        MovieGridView(movie: MockData.movies[1])
        //  .preferredColorScheme(.dark)
    }
}
