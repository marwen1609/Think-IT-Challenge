//
//  AppCoordinator.swift
//  Think-IT-Challenge
//
//  Created by Marwen Jamel on 7/25/20.
//  Copyright © 2020 MarwenJamel. All rights reserved.
//

import Foundation
import UIKit


class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var window: UIWindow?
    // MARK: - Initializers
    init(navigationController: UINavigationController ) {
        self.navigationController = navigationController
    }
    
    // MARK: - LifeCycle
    func start() {
        showSignInCoordinator()
    }
    
    // MARK: - Members
    
    func showSignInCoordinator(){
        let welcomeCoordinator = WelcomeCoordinator(navigationController: self.navigationController)
        welcomeCoordinator.parentCoordinator = self
        childCoordinators.append(welcomeCoordinator)
        welcomeCoordinator.start()
    }
 
    
    
    func coordinatorDidExit(coordinator: Coordinator) { }
}

