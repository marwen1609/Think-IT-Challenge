//
//  WelcomeViewController.swift
//  Think-IT-Challenge
//
//  Created by Marwen Jamel on 7/25/20.
//  Copyright © 2020 MarwenJamel. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
     // MARK: - IBOutlets
    @IBOutlet weak var nameTexField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
     // MARK: - Properites
    var viewModel: WelcomeViewModel?
    
     // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.layer.cornerRadius = 8
        continueButton.clipsToBounds = true

    }


}
