//
//  SearchResult.swift
//  ItunesSearchApp
//
//  Created by Mehdi MMS on 07/03/2022.
//

import Foundation

class SearchResult {
    var artistName = ""
    var trackName = ""
    var itemDescription = ""
    var trackPrice = 0.00
    
    init?(json: [String : AnyObject ]) {
        guard let artistName = json["artistName"] as? String,
              let trackName = json["trackName"] as? String else { return nil }
        
        let itemDescription = json["itemDescription"]
        let price = json["trackPrice"]
        
        self.artistName = artistName
        self.trackName = trackName
        
        if let trackP = price as? Double {
            self.trackPrice = trackP
        }
        
        if let d = itemDescription as? String {
            self.itemDescription = d
        }
    }
}
