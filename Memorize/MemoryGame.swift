//
//  MemoryGame.swift
//  Memorize
//
//  Created by Sanchit Kalra on 27/11/21.
//

// THIS IS THE MODEL

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable { // here CardContent is a generic (sorta like a placeholder whose type will be specified on init.)
    
    // the statement 'where CardContent: Equatable' just means that we care about some properties of the CardContent and we are specifying that CardContent is comparable and can be compared in any kind of if statements. Basically our don't-care type of CardContent has to conform to Equatable
    
    private(set) var cards: Array<Card> // this card refers to MemoryGame.Card if accessed outside of the struct MemoryGame.
    
    private var indexOfTheOneAndOnlyOneFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        // if let chosenIndex = index(of: card){ // grabbing value of the optional index() and assigning it to chosenIndex if it exists; not using the ! unwrapper because it will crash the app if nil is returned and we don't want that
        // if an if statement begins with let, we can't use the && operator and find the let constant in scope for other conditions, we need to use a comma (,) for that case
        if let chosenIndex = cards.firstIndex(where: { aCardInTheCardsArray in aCardInTheCardsArray.id == card.id }), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched { // this can be simplified futher as:
            // where: { $0.id == card.id } // $0 refers to the current card in the firstIndex's loop
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyOneFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyOneFaceUpCard = nil
            } else {
                for index in cards.indices { // cards.indicies returns an iterable of the indices available in that iterable
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyOneFaceUpCard = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("chosen card is \(card)")
    }
    
    func index(of card: Card) -> Int? { // the return is now an optional
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index // return the actual index if it's available
            }
        }
        return nil // bogus // return nil if card isn't found
    } // this is a built in function in Swift called the firstIndex; we need not implement it on our own everytime
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) { // the second argument's type signifies that it is a function and expects a function that takes an int and returns something of the type CardContent.
        cards = Array<Card>()
        
        // add two cards for each iteration of the for loop.
        for pairIndex in 0..<numberOfPairsOfCards {
            
            let content: CardContent = createCardContent(pairIndex) // we are depending on the ViewModel to tell us how to create the card's content depending on the index and we let it pass a function as the second argument when init the Model.
            
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    
    struct Card: Identifiable { // identifiable basically means that this struct can be identified uniquely among many many other structs
        
        var id: Int // this is a protocol stud, which basically are vars and functions necessary to conform to the type of struct, in this case, Identifiable
        // ObjectIdentifier (this was the type of id) (in this case Int) is an any type but the only restriction is that it should be hashable and equatable so that we can look it up in  hash table
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        // we have provided isFaceUp and isMatched's initial values as false because they'll always be the same and never need to be respecified.
        var content: CardContent // using CardContent means that now whenever MemoryGame will be initialised, CardContent also need to be explicity mentioned and that will be the type of the var content.
        
    }
    
}
