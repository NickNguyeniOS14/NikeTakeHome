//
//  NetworkService.swift
//  NikeTakeHome
//
//  Created by Nick Nguyen on 10/8/20.
//

import Foundation

//https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum Networking {

    static func performRequestFor(url: URL, httpMethod: HTTPMethod, parameters: [String: String]? = nil, headers: [String: String]? = nil, body: Data? = nil, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {

        var formattedURL: URL? = url

        if let parameters = parameters { formattedURL = format(url: url, with: parameters) }

        guard let requestURL = formattedURL else { fatalError("requestURL is nil") }

        var request = URLRequest(url: requestURL)

        request.httpMethod = httpMethod.rawValue
        request.httpBody = body

        if let headers = headers {
            headers.forEach { (key, value) in
                request.setValue(value, forHTTPHeaderField: key)
            }
        }

        URLSession.shared.dataTask(with: request, completionHandler: completion).resume()
    }

    static private func format(url: URL, with queryParameters: [String: String]) -> URL? {

        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)

        urlComponents?.queryItems = queryParameters.compactMap({ URLQueryItem(name: $0.key, value: $0.value) })

        return urlComponents?.url ?? nil
    }
}
