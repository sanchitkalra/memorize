//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sanchit Kalra on 28/11/21.
//

// THIS IS THE VIEWMODEL

import SwiftUI

//func makeCardContent (index: Int) -> String {
//    return "😃"
//}

class EmojiMemoryGame: ObservableObject { // observable object are objects which can publish to the world that something has changed
   
    static let emojis = ["🏎", "🛺", "🚓", "🚈", "🚌", "🚜", "🛴", "🚤", "🛸"]
    
    // ViewModel (this file) has the job to protect the model from ill-behaved views or anything else that has access to the ViewModel.
    
    // this is one way to do it by using a referenced function.
    // private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: makeCardContent) // here private means that only the ViewModel's code can see this model and nobody else. Private Set means that the model is reachable but is view only; no one outside of this ViewModel can't edit but only read this object.
    
    // the other way is as follows where the function is inline
//    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: {(index: Int) -> String in
//        return "😃"
//    })
    // we can rewrite "(index: Int) -> String" to just "index" because Swift knows from context that the type of CardContent is String and for single arguments paranthesis aren't required around the argument' s label.
    // we can also omit the return keyword and simplify this even further. hence it becomes: {index in "😃"}
    // finally we can take the function out of the init where it is the second argument and replace index by _ because it is never used and only a constant string is returned and the entire init simplifies to:
    // private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4) { _ in "😃"}
    // this is how it would be possible but we'll actually use the index because we won't return the same emoji everytime.
    
    // FINAL IMPLEMENTATION
    
    @Published private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
        
        EmojiMemoryGame.emojis[pairIndex] // EmojiMemoryGame is requried because the var is now static and a global var.
        
    } // using @Published saves us the effort of writing objectWillChange.send() everywhere because now this object is tracked and any changes to it are notified automatically
    
    // var objectWillChange: ObservableObjectPublisher // this is what we'll use to publish to the world that something's changed; although we don't really need to init this, this is auto init
    
    // ref: self and static and property init
    
    var  cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        // objectWillChange.send() // instructing the viewmodel to publish changes
        model.choose(card)
    }
    
}
