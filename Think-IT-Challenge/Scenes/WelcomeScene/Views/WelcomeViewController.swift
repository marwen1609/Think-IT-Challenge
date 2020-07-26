//
//  WelcomeViewController.swift
//  Think-IT-Challenge
//
//  Created by Marwen Jamel on 7/25/20.
//  Copyright © 2020 MarwenJamel. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WelcomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameTexField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: - Properites
    var viewModel: WelcomeViewModel?
    let disposeBag = DisposeBag()
    // MARK: - LifeCycle
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBindings()
    }
    
    
    // MARK: - Members
    
    fileprivate func setupViews() {
        continueButton.layer.cornerRadius = 8
        continueButton.clipsToBounds = true
    }
    
    ///Setting up the properties binding to the view model
    fileprivate func setupBindings(){
        guard let viewModel = self.viewModel else { return }
        
        nameTexField.rx
            .text
            .orEmpty
            .bind(to: viewModel.name)
            .disposed(by: disposeBag)
        
        viewModel.isContinueActive
            .bind(to: continueButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        continueButton.rx
            .tap
            .bind { viewModel.continueButtonTapped() }
            .disposed(by: disposeBag)
        
    }
}
