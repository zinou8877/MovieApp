//
//  ApiService.swift
//  MovieApp
//
//  Created by zz on 29/6/2024.
//

import Foundation

func fetchData() async throws-> MovieResponse{
    let key : String = "1b65deb79910e86f548e831702fa8448"
    let endPoint = "https://api.themoviedb.org/3/discover/movie?api_key=\(key)"
    
    guard let url = URL(string: endPoint) else {
        throw MovieError.invalidEndpoint
    }
    
    let (data, response) = try await URLSession.shared.data (from: url)
   
    guard let response = response as? HTTPURLResponse, response.statusCode == 200
    else {
        
        throw MovieError.invalidResponse
    }
    
    do {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try decoder.decode(MovieResponse.self, from: data)
    }catch {
        throw MovieError.noData
    }
    
    
    
}


func fetchMovieDetails(id : Int) async throws-> MovieDetails{
    let api_key = "1b65deb79910e86f548e831702fa8448"
    
    
    var endPoint = "https://api.themoviedb.org/3/movie/"
    endPoint = endPoint + (String(id) )
    endPoint = endPoint + "?api_key="+api_key
 
guard let url = URL(string: endPoint) else {
    throw MovieError.invalidEndpoint
}

let (data, response) = try await URLSession.shared.data (from: url)
print("ss open")
guard let response = response as? HTTPURLResponse, response.statusCode == 200
else {
    print ("inncav")
    throw MovieError.invalidResponse
}

do {
    print ("yyyy")
    print(data)
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    return try decoder.decode(MovieDetails.self, from: data)
}catch {
    print("Error decoding JSON: \(error)")
    throw MovieError.noData
}



}
