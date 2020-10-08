//
//  Model.swift
//  NikeTakeHome
//
//  Created by Nick Nguyen on 10/8/20.
//

import Foundation
// Cell : shows name of album, artist, thumbnail image
// Detail: (bonus) larger image, genre, release date, copyright info, a button to show website

struct Album: Decodable {
    let artistName: String
    let id: String
    let releaseDate: String
    let name: String
    let copyright: String
    let artworkUrl100: String
    let url: String
    let genres: [Genre]
}

struct Genre: Decodable {
    let name: String
}

struct Feed: Decodable {
    let results: [Album]
}

// Result
struct RootJSON: Decodable {
    let feed: Feed
}
