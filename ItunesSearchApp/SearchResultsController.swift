//
//  SearchResultsController.swift
//  ItunesSearchApp
//
//  Created by Mehdi MMS on 07/03/2022.
//

import Foundation

class SearchResultsController {
    static func searchResultForSearchTerm(searchTerm: String, completion: @escaping (_ results: [SearchResult]?) -> Void) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        fetchJson(url: url) { (json) in
            guard let j = json,
                  let allResults = j["results"] as? [[String: AnyObject]] else { return }
            let searchResults = allResults.flatMap({ return SearchResult(json: $0) })
            completion(searchResults)
        }
    }
    
    static func fetchJson(url: URL, completion: @escaping (_ json: [String : AnyObject]?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let e = error {
                print("Error downloading data \(e)")
            } else if let d = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: d, options: []) as? [String : AnyObject] {
                        completion(json)
                    }
                } catch let jsonError {
                    print("Error decoding JSON \(jsonError)")
                }
            }
        }
        task.resume()
    }
}
