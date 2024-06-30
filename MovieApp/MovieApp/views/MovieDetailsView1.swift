//
//  MovieDetails.swift
//  MovieApp
//
//  Created by zz on 28/6/2024.
//

import SwiftUI

struct MovieDetailsView1: View {
    
    var movie: Int
    @State var movieDetail : MovieDetails?
    @State private var isShowingSafariView = false
    var body: some View {
        ScrollView{
            VStack {
                
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movieDetail?.backdropPath ?? "")" ))
                { phase in
                    switch phase {
                    case .failure: Image(systemName: "photo") .font(.largeTitle)
                    case .success(let image):
                        image.resizable()
                    default: ProgressView()
                        
                    }
                }
                .frame(width: 280, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .scaledToFit()
                
                
                Text(movieDetail?.title ??  MockData.movies[1].title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.label))
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
                Text(movieDetail?.overview ?? MockData.movies[1].overview)
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
                Text(movieDetail?.releaseDate ?? MockData.movies[1].releaseDate)
                    .multilineTextAlignment(.leading)
                Spacer()
                
                
            }
            
            HStack(alignment : .center){
                Text("Original Title : ").font(.title2).underline() .multilineTextAlignment(.leading)
                    .padding(.bottom ,4)
                    .padding(.leading ,7)
                Text(movieDetail?.originalTitle ?? MockData.movies[1].originalTitle)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
            }
            
            Spacer()
            Button {
                isShowingSafariView = true
            }
        label: {
            Label("View Trailer", systemImage: "video")
        }
            
           
            
            
        .padding()
        }.sheet( isPresented: $isShowingSafariView  ,
                 content: {SafariView(url: (URL(string: movieDetail!.homepage ) ?? URL (string : "www.google.com"))!)})
        .task {
            do {
                print ("hhhhh")
                movieDetail  = try await fetchMovieDetails(id : movie)
                //print (movieDetail )
            } catch MovieError.invalidEndpoint {
                print ("invalid URL")}
            catch MovieError.invalidResponse {
                print ("invalid response")
            } catch MovieError.noData {
                print ("no data")
            }
            catch {
                print ("unexpected error")
                
            }}
        
    }
    
}



struct Home1_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView1(movie: MockData.movies[0].id)
          .preferredColorScheme(.dark)
    }
}
