//
//  ModelController.swift
//  NikeTakeHome
//
//  Created by Nick Nguyen on 10/8/20.
//

import Foundation
//https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json

class AlbumController {

    var albums: [Album]?

    lazy var url: URL = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rss.itunes.apple.com"
        components.path = "/api/v1/us/apple-music/coming-soon/all/100/explicit.json"
        return components.url!
    }()

    func fetchAlbumsFromServer(callback: @escaping () -> ()) {
        Networking.performRequestFor(url: url, httpMethod: .get) { (data, response, error) in
            guard let data = data else { return }
            if let err = error {
                print(err.localizedDescription)
            }
            print(response!)
            let jsonDecoder = JSONDecoder()
            do {
                let rootJSON = try jsonDecoder.decode(RootJSON.self, from: data)
                self.albums = rootJSON.feed.results
                callback() // 
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
