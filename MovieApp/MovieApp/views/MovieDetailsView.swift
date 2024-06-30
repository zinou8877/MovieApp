//
//  MovieDetails.swift
//  MovieApp
//
//  Created by zz on 28/6/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let movie: Movie
    
    var body: some View {
        ScrollView{
            VStack {
               
                
                
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)" ))
                { phase in
                    switch phase {
                    case .failure: Image(systemName: "photo") .font(.largeTitle)
                    case .success(let image):
                        image.resizable()
                    default: ProgressView()
                        
                    }
                }
                .frame(width: 240, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                
                Text(movie.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.label))
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
                
                Text(movie.overview)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.label))
                    .padding(10)
                    .minimumScaleFactor(0.6)
            }
            HStack(alignment : .center){
                Text("Release Date : ").font(.title2).underline() .multilineTextAlignment(.leading)
                    .padding(.bottom ,4)
                    .padding(.leading ,7)
                    Text(movie.releaseDate)
                    .multilineTextAlignment(.leading)
                Spacer()
                
                
                }
                
            HStack(alignment : .center){
                Text("Original Title : ").font(.title2).underline() .multilineTextAlignment(.leading)
                    .padding(.bottom ,4)
                    .padding(.leading ,7)
                Text(movie.originalTitle)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                }
                            
                Spacer()
                Button {}
                    label: {
                        Label("View Trailer", systemImage: "video")
                    }.background()
                    //.sheet(item: <#T##Binding<Identifiable?>#>, content: //<#T##(Identifiable) -> View#>) // don't have the youtube video
                
            
            .padding()
        }}
}

struct MoviedetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: MockData.movies[1])
        
    }
}
