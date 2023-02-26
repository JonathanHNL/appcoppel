//
//  ListMoviesPresenter.swift
//  copelAppPelis
//
//  Created by Johnne Lemand on 25/02/23.
//

import Foundation
import UIKit

protocol ListMoviesUI: AnyObject{
    func update(movies:[NowPlayingEntity])
}

class ListMoviesPresenter{
    var ui:ListMoviesUI
    
    private let listMoviesInteractor : ListMoviesInteractor
    var models: [NowPlayingEntity] = []
    
    init(listMoviesInteractor: ListMoviesInteractor){
        self.listMoviesInteractor = listMoviesInteractor
    }
    
    func onViewAppear() {
        Task {
            models = await listMoviesInteractor.getListMovies().results
            ui?.update(movies: models)
        }
    }
    
}

