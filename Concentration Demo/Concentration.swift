//
//  Concentration.swift
//  Concentration Demo
//
//  Created by Android on 7/1/19.
//  Copyright © 2019 Marina Shostak. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter{ cards[$0].isFacedUp}.oneAndOnly
        }
        set {
            for i in cards.indices {
                cards[i].isFacedUp = (i == newValue)
            }
        }
    }
    
    func chooseCard(at index:Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)) : Choosen index out of range")
        if !cards[index].isMatched {
            if let matchedIndex = indexOfOneAndOnlyFaceUpCard, matchedIndex != index {
                //if equals
                if cards[matchedIndex] == cards[index] {
                    cards[index].isMatched = true
                    cards[matchedIndex].isMatched = true
                }
                cards[index].isFacedUp = true
            }
            else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairs: Int) {
        assert(numberOfPairs > 0, "Concentration.init(\(numberOfPairs)) : You must have at least one pair of cards")
        for _ in 1...numberOfPairs{
            let card = Card()
            cards += [card, card]
        }
        
        cards.shuffle()
    }
}

extension Collection{
    var oneAndOnly: Element?{
        return count == 1 ? first : nil
    }
}
