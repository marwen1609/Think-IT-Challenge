//
//  WelcomeViewModel.swift
//  Think-IT-Challenge
//
//  Created by Marwen Jamel on 7/25/20.
//  Copyright © 2020 MarwenJamel. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class WelcomeViewModel {
    
    // MARK: - Properties
    let name: BehaviorRelay<String> = BehaviorRelay(value: "")
    let isContinueActive: Observable<Bool>
    let navigateToHome = PublishSubject<String>()
    
    init() {
        isContinueActive = name.map{
            return $0.count > 2
        }.asObservable()
    }
    
    func continueButtonTapped(){
        navigateToHome.onNext(name.value)
    }
    
}
