//
//  NowPlayingResponseEntity.swift
//  copelAppPelis
//
//  Created by Johnne Lemand on 26/02/23.
//

import Foundation

struct NowPlayingResponseEntity: Decodable {
    let results: [NowPlayingEntity]
    
}
