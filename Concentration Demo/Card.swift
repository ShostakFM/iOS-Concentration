//
//  Card.swift
//  Concentration Demo
//
//  Created by Android on 7/1/19.
//  Copyright © 2019 Marina Shostak. All rights reserved.
//

import Foundation

struct Card: Hashable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getIdentifier()
    }
}
