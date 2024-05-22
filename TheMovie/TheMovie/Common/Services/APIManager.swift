//
//  APIManager.swift
//  TheMovie
//
//  Created by Jeiel Lima on 21/05/24.
//

import Foundation

class APIManager {
    
    let key = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YWEyMzZhZWIzMWE3MjFkZTE2ZTQ0NTlmMTU5NTE0MSIsInN1YiI6IjY2NGQwYmNiZDI1MjFhZDVhZTEzYmVhYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.OjrgHXOHkNuDGPXcrTo_-HScuFmPkecOQnm_1mftwqI"
    
    let baseUrl = "https://api.themoviedb.org/3"
    
    func popularMovies(completion: @escaping ([Movie]?) -> Void) {
        let url = "\(baseUrl)/movie/popular?api_key=\(key)"
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(MovieResponse.self, from: data) {
                    completion(response.results)
                } else {
                    print("Invalid Response")
                    completion(nil)
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
}
