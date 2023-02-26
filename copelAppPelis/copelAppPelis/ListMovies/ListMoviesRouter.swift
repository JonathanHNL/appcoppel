//
//  ListMoviesRouter.swift
//  copelAppPelis
//
//  Created by Johnne Lemand on 25/02/23.
//

import Foundation
import UIKit

class  ListMoviesRouter {
    func showListMovies(window: UIWindow?){
        let view = ListMoviesView()
        let interactor = ListMoviesInteractor()
        let presenter = ListMoviesPresenter(listMoviesInteractor: interactor)
        presenter.ui = view
        view.presenter = presenter
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
