//
//  ModelController.swift
//  NikeTakeHome
//
//  Created by Nick Nguyen on 10/8/20.
//

import UIKit
//https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json

final class AlbumController {

    var albums: [Album] = []
    
    private let imageCache = NSCache<NSString,UIImage>()

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

    func downloadImageFor(_ album: Album, completion: @escaping (Result<UIImage,Error>) -> Void) {
        let cachedKey = NSString(string: album.id)

        if let image = imageCache.object(forKey: cachedKey) {
            completion(.success(image))
            return
        }
        let url = URL(string: album.artworkUrl100)!

        Networking.performRequestFor(url: url, httpMethod: .get) { (data, response, error) in
            guard let data = data else {fatalError()}

            if let err = error {
                print(err.localizedDescription)
            }
            guard let image = UIImage(data: data) else  {
                completion(.failure(NSError()))
                return
            }
            self.imageCache.setObject(image, forKey: cachedKey)
            completion(.success(image))

        }
    }
}
