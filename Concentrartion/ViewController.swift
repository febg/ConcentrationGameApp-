//
//  ViewController.swift
//  Concentrartion
//
//  Created by Felipe Ballesteros on 2018-02-24.
//  Copyright © 2018 FBApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game: Concentration = Concentration(cardsPairNumber: (cardsButtons.count + 1)/2)
    
    var flipCount = 0
    
    @IBOutlet weak var flipsLabel: UILabel!
    
    @IBOutlet var cardsButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton){

        if let cardNumber = cardsButtons.index(of: sender) {
            game.choseCard(at: cardNumber)
        }
        else{
            print("chosen card was not adedn to cardarray")
        }
        updateViewFromModel()
    }
    
    private func updateViewFromModel(){
        flipsLabel.text = "Flips: \(Concentration.flipCount)"
        for index in cardsButtons.indices{
            let button = cardsButtons[index]
            let card = game.cards[index]
            if card.faceUp{
               
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatch ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emoji: [String] = ["🕷","🦇","🕸","🎃","🔪","👻","💀","👽"]
    private var cardEmoji = [Int:String]()
    
    private func emoji(for card: Card) -> String{
        if cardEmoji[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emoji.count)))
            cardEmoji[card.identifier] = emoji.remove(at: randomIndex)
        }
        return cardEmoji[card.identifier] ?? "?"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

