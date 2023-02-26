//
//  NowPlayingEntity.swift
//  copelAppPelis
//
//  Created by Johnne Lemand on 26/02/23.
//

import Foundation

struct NowPlayingEntity: Codable {
    var id: Int
    var title: String
    var overview: String
    var imageURL: String
    var votes: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case imageURL = "poster_path"
        case votes = "vote_average"
    }
}
