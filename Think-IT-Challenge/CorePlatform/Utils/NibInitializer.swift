//
//  NibInitializer.swift
//  Think-IT-Challenge
//
//  Created by Marwen Jamel on 7/25/20.
//  Copyright © 2020 MarwenJamel. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    static func initFromNib() -> Self {
        func instanceFromNib<T: UIViewController>() -> T {
            return T(nibName: String(describing: self), bundle: nil)
        }
        return instanceFromNib()
    }
}
