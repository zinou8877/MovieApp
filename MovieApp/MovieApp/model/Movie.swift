//
//  Movie.swift
//  MovieApp
//
//  Created by zz on 28/6/2024.
//

import Foundation
struct MovieResponse : Decodable {
    var results: [Movie]
}
struct Movie: Hashable, Identifiable , Decodable{
    let adult: Bool
    let backdropPath: String
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview : String
    let popularity: Float
    let posterPath: String
    let releaseDate:   String
    let title: String
    let video: Bool
    let voteAverage: Float
    let voteCount : Float
}


struct MockData {
    
    static let movies =  [
        Movie(
        adult :  false,
        backdropPath: "/xg27NrXi7VXCGUr7MG75UqLl6Vg.jpg",
        genreIds: [16,10751,12,35],
        id : 1022789,
        originalLanguage: "en",
        originalTitle :  "Inside Out 3",
        overview: "Teenager Riley's mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone.",
        popularity :  5116.905,
        posterPath: "/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg",
        releaseDate :  "2024-06-11",
        title :  "Inside Out 2",
        video: false,
        voteAverage:  7.7,
        voteCount : 1001
    ),
        Movie(
            adult :  false,
            backdropPath: "/xg27NrXi7VXCGUr7MG75UqLl6Vg.jpg",
            genreIds: [16,10751,12,35],
            id: 746036,
            originalLanguage: "en",
            originalTitle: "The Fall Guy",
            overview: "Fresh off an almost career-ending accident, stuntman Colt Seavers has to track down a missing movie star, solve a conspiracy and try to win back the love of his life while still doing his day job. ",
            popularity : 564.906,
            posterPath :  "/aBkqu7EddWK7qmY4grL4I6edx2h.jpg" ,
            releaseDate :  "2024-04-24" ,
            title :  "The Fall Guy" ,
            video : false,
            voteAverage : 7.293,
            voteCount : 1411
                                    
                                 )
    
    ];
}

enum MovieError: Error, CustomNSError {
    
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
    
}

struct MovieDetails :  Decodable,Hashable, Identifiable{
    
    let adult: Bool
    let backdropPath: String
    struct belongsToCollection: Decodable {}
    let budget: Float
    struct Genre: Decodable {
        let id: Int
        let name: String
    }
    let homepage: String
    let id: Int
    let imdbId: String
    let originCountry: [String ]
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Float
    let posterPath: String
    struct ProductionCompany: Decodable {
        let id: Int
        let logoPath: String? // Optional because logo_path can be null in JSON
        let name: String
        let originCountry: String
        
        private enum CodingKeys: String, CodingKey {
            case id
            case logoPath = "logo_path"
            case name
            case originCountry = "origin_country"
        }
    }
    
    let productionCountries: [[String: String]]?
    let releaseDate: String
    let revenue: Float
    let runtime: Int
    let spokenLanguages: [[String: String]]
    let status : String
    let tagline: String
    let title: String
    let video: Bool
    let voteAverage: Float
    let voteCount: Int
    
}


