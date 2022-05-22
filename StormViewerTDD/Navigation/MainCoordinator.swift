//
//  MainCoordinator.swift
//  StormViewerTDD
//
//  Created by Fabio Tiberio on 22/05/22.
//

import UIKit

class MainCoordinator {
    var navigationController = UINavigationController()
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let viewController = storyboard.instantiateInitialViewController() as? ViewController else {
            fatalError("Missing initial view controller in Main.storyboard")
        }
        viewController.pictureSelectAction = { [weak self] in
            self?.showDetail(for: $0)
        }
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showDetail(for filename: String) {
        let vc = DetailViewController()
        vc.selectedImage = filename
        navigationController.pushViewController(vc, animated: true)
    }
}

