//
//  WelcomeCoordinator.swift
//  Think-IT-Challenge
//
//  Created by Marwen Jamel on 7/25/20.
//  Copyright © 2020 MarwenJamel. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class WelcomeCoordinator: Coordinator {
    
    // MARK: - Properties
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    let welcomeController = WelcomeViewController.initFromNib()
    let homeController = HomeViewController.initFromNib()
    let viewModel = WelcomeViewModel()
    private let disposeBag = DisposeBag()
    let defaults = UserDefaults.standard
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    // MARK: - LifeCycle
    func start()  {
        
        navigationController.navigationBar.isHidden = true
        showWelcomeController()
        showHomeController()
    }
    
    // MARK: - Members
    
    func showWelcomeController() {
        if let username = defaults.object(forKey: "username") as? String {
            
            let homeViewModel = HomeViewModel(name: username)
            self.homeController.viewModel = homeViewModel
            self.navigationController.pushViewController(self.homeController, animated: true)
            
        }else {
            welcomeController.viewModel = viewModel
            self.navigationController.pushViewController(self.welcomeController,animated: true)
        }
        
    }
    
    func showHomeController() {
        viewModel.navigateToHome.subscribe(onNext: { [weak self] (name) in
          guard let `self` = self else { return }
            
            self.defaults.set(name, forKey: "username")
            let homeViewModel = HomeViewModel(name: name)
            self.homeController.viewModel = homeViewModel
            self.navigationController.pushViewController(self.homeController, animated: true)
            }).disposed(by: disposeBag)
    }
    
    
    
    func coordinatorDidExit(coordinator: Coordinator) { }
}
