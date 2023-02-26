//
//  SceneDelegate.swift
//  copelAppPelis
//
//  Created by Johnne Lemand on 24/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var listMoviesRouter = ListMoviesRouter()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(vindowScene: UIWindowScene)
        listMoviesRouter.showListMovies(window: window)
    }

}

