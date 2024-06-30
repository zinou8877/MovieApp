//
//  Home.swift
//  MovieApp
//
//  Created by zz on 28/6/2024.
//


import SwiftUI



final class MovieGridViewModel: ObservableObject {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())
    ]
    
}
struct Home: View {
    
    @StateObject var viewModel = MovieGridViewModel()
    @State var movieResponce: MovieResponse?
    
    var body: some View {
        
        NavigationView {
            VStack{Text("Discover 🍿").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                List {
                    
                    //  LazyVGrid(columns: viewModel.columns) {
                    ForEach( movieResponce?.results ?? []) { movie in
                        
                        
                        NavigationLink {
                            MovieDetailsView1(movie : movie.id)
                        } label: {
                            MovieGridView(movie: movie)
                        }
                        
                        
                    }
                }.padding(4)
            }}

                .task {
                    do {
                       
                        movieResponce  = try await fetchData()
                        print (movieResponce?.results ?? "null")
                    } catch MovieError.invalidEndpoint {
                        print ("invalid URL")}
                    catch MovieError.invalidResponse {
                        print ("invalid response")
                    } catch MovieError.noData {
                        print ("no data")
                    }
                    catch {
                        print ("unexpected error")
                        
                    }
                }
    }
}
    
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
              .preferredColorScheme(.dark)
        }
    }
    
    

