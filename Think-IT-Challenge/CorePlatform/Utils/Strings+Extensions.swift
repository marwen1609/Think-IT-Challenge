//
//  Strings+Extensions.swift
//  Think-IT-Challenge
//
//  Created by Marwen Jamel on 7/26/20.
//  Copyright © 2020 MarwenJamel. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
