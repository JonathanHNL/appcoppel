//
//  ListMoviesInteractor.swift
//  copelAppPelis
//
//  Created by Johnne Lemand on 25/02/23.
//

import Foundation
import UIKit




class ListMoviesInteractor  {
    
    func getListMovies() async -> NowPlayingResponseEntity{
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=762775066f9e29c9c7b8daa10401b028")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(NowPlayingResponseEntity.self, from: data)
    
    }
}
