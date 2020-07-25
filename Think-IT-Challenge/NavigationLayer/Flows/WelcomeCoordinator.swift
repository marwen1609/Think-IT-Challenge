//
//  WelcomeCoordinator.swift
//  Think-IT-Challenge
//
//  Created by Marwen Jamel on 7/25/20.
//  Copyright © 2020 MarwenJamel. All rights reserved.
//

import Foundation
import UIKit

class WelcomeCoordinator: Coordinator {
    
    // MARK: - Properties
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    let welcomeController = WelcomeViewController.initFromNib()
    let viewModel = WelcomeViewModel()
//    private let disposeBag = DisposeBag()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    // MARK: - LifeCycle
    func start()  {
        
        navigationController.navigationBar.isHidden = true
        showWelcomeController()
        
    }
    
    // MARK: - Members
    func showWelcomeController() {
        
        welcomeController.viewModel = viewModel
        self.navigationController.setViewControllers([self.welcomeController],animated: true)
        
        
    }
    
    
    
    func coordinatorDidExit(coordinator: Coordinator) { }
}
