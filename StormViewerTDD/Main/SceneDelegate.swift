//
//  SceneDelegate.swift
//  StormViewerTDD
//
//  Created by Fabio Tiberio on 22/05/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        coordinator = MainCoordinator()
        coordinator?.start()
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = coordinator?.navigationController
        window?.makeKeyAndVisible()
    }
}

