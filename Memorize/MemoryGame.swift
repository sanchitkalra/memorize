//
//  MemoryGame.swift
//  Memorize
//
//  Created by Sanchit Kalra on 27/11/21.
//

import Foundation

struct MemoryGame<CardContent> { // here CardContent is a generic (sorta like a placeholder whose type will be specified on init.)
    
    private(set) var cards: Array<Card> // this card refers to MemoryGame.Card if accessed outside of the struct MemoryGame.
    
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) { // the second argument's type signifies that it is a function and expects a function that takes an int and returns something of the type CardContent.
        cards = Array<Card>()
        
        // add two cards for each iteration of the for loop.
        for pairIndex in 0..<numberOfPairsOfCards {
            
            let content: CardContent = createCardContent(pairIndex) // we are depending on the ViewModel to tell us how to create the card's content depending on the index and we let it pass a function as the second argument when init the Model.
            
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        // we have provided isFaceUp and isMatched's initial values as false because they'll always be the same and never need to be respecified.
        var content: CardContent // using CardContent means that now whenever MemoryGame will be initialised, CardContent also need to be explicity mentioned and that will be the type of the var content.
        
    }
    
}
