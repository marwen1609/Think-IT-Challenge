//
//  HomeViewModel.swift
//  Think-IT-Challenge
//
//  Created by Marwen Jamel on 7/26/20.
//  Copyright © 2020 MarwenJamel. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    
    // MARK: - Properties
    var rooms = Rooms()
    var name: String
    let welcomeText: BehaviorRelay<String> = BehaviorRelay(value: "")
    let dateText: BehaviorRelay<String> = BehaviorRelay(value: "")
    lazy var dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()
    
    // MARK: - Initilizers
    init(name: String) {
        
        self.name = name
        rooms = createMockedRomms()
        welcomeText.accept("Welcome, \(name.capitalizingFirstLetter())!")
        dateText.accept(dateFormatter.string(from: Date()))
    }
    
    // MARK: - Members
    
    func createMockedRomms() -> Rooms {
        var rooms = Rooms()
        
        rooms.append(Room(id: 1, name: "Living Room", devices: 4, imageName: "livingroom"))
        rooms.append(Room(id: 2, name: "Media Room", devices: 6, imageName: "mediaroom"))
        rooms.append(Room(id: 3, name: "Bathroom", devices: 1, imageName: "bathroom"))
        rooms.append(Room(id: 4, name: "Bedroom", devices: 3, imageName: "bedroom"))
        
        return rooms
    }
}
