//
//  Concentration.swift
//  Concentrartion
//
//  Created by Felipe Ballesteros on 2018-02-24.
//  Copyright © 2018 FBApps. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var indexOfFacedUpCard: Int? {
        get {
            var foundIndex : Int?
            for index in cards.indices{
                if cards[index].faceUp{
                    if foundIndex == nil{
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices{
                cards[index].faceUp = ( index == newValue)
            }
        }
    }
    
    static var flipCount = 0
    
    init(cardsPairNumber: Int){
        for _ in 1...cardsPairNumber{
            let card = Card()
            cards += [card, card]
        }
        suffleCards()
    }
    
    func choseCard(at index: Int){
        Concentration.flipCount += 1
        print(Concentration.flipCount)
        if !cards[index].isMatch {
            if let matchIndex = indexOfFacedUpCard, matchIndex != index {
                if cards[index].identifier == cards[matchIndex].identifier {
                    cards[index].isMatch = true
                    cards[matchIndex].isMatch = true
             
                }
                  cards[index].faceUp = true
            }
            else{
                indexOfFacedUpCard = index
            }
        }
        else{
            cards[index].faceUp = false
        }
    } 
    
    private func suffleCards(){
        let count =  cards.count
            if count < 2 { return }
            for i in 0..<(count - 1) {
                let j = Int(arc4random_uniform(UInt32(count - i))) + i
                let backUp = cards[i]
                cards[i] = cards[j]
                cards[j] = backUp
            }
        
    }
}
