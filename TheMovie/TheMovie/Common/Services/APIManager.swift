//
//  APIManager.swift
//  TheMovie
//
//  Created by Jeiel Lima on 21/05/24.
//

import Foundation

class APIManager {
    private let apiKey = "4aa236aeb31a721de16e4459f1595141"
    private let baseURL = "https://api.themoviedb.org/3"

    func getPopularMovies(completion: @escaping ([Movie]?) -> Void) {
        guard let url = URL(string: "\(baseURL)/movie/popular?api_key=\(apiKey)") else {
            completion(nil)
            return
        }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("HTTP Request Failed \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }

            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(response.results)
            } catch {
                print("Failed to decode JSON: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
}
