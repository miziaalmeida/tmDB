//
//  MovieDetailsModel.swift
//  TheMovie
//
//  Created by Jeiel Lima on 22/05/24.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
}

struct MovieResponse: Codable {
    let results: [Movie]
}
