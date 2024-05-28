//
//  APIManager.swift
//  TheMovie
//
//  Created by Jeiel Lima on 21/05/24.
//

import Foundation

class APIManager {

    func getPopularMovies(completion: @escaping ([Movie]?) -> Void) {
        guard let url = URL(string: "\(Worker.baseURL)/movie/popular?api_key=\(Worker.apiKey)") else {
            completion(nil)
            return
        }

        var request = URLRequest(url: url)
        request.setValue(Worker.type, forHTTPHeaderField: Worker.httpField)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(APIErrors.requestFailed, error)
                completion(nil)
                return
            }

            guard let data = data else {
                print(APIErrors.noData)
                completion(nil)
                return
            }

            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(response.results)
            } catch {
                print(APIErrors.jsonError, error)
                completion(nil)
            }
        }
        task.resume()
    }
}
