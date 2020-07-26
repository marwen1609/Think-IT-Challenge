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
    let homeViewModel = HomeViewModel()
    private let disposeBag = DisposeBag()
    
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
        welcomeController.viewModel = viewModel
        self.navigationController.pushViewController(self.welcomeController,animated: true)
    }
    
    func showHomeController() {
        viewModel.navigateToHome.subscribe(onNext: { [weak self] (name) in
            guard let `self` = self else { return }
            
            self.homeController.viewModel = self.homeViewModel
            self.homeController.name = name
            self.navigationController.pushViewController(self.homeController, animated: true)
            }).disposed(by: disposeBag)
    }
    
    
    
    func coordinatorDidExit(coordinator: Coordinator) { }
}
