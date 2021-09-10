//
//  NetworkService.swift
//  Finam News
//
//  Created by mr_aNalogman on 8/23/21.
//  Copyright © 2021 mr_aNalogman. All rights reserved.
//

import Foundation

//
//Fetch JSON from API and return as array
//
class NetworkService {
    func FetchAllEmployees(query: URL, completion: @escaping (Result<NewsResponse, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: query, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else { return }
                do {
                    let news = try JSONDecoder().decode(NewsResponse.self, from: data)
                    completion(.success(news))
                } catch let jsonError {
                    print("Failed JSON decode: ", jsonError)
                    completion(.failure(jsonError))
                }
            }
        })

        task.resume()
    }
}
