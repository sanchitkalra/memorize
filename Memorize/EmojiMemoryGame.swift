//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sanchit Kalra on 28/11/21.
//

import SwiftUI

//func makeCardContent (index: Int) -> String {
//    return "😃"
//}

class EmojiMemoryGame {
   
    static let emojis = ["🏎", "🛺", "🚓", "🚈", "🚌", "🚜", "🛴", "🚤", "🛸"]
    
    // ViewModel (this file) has the job to protect the model from ill-behaved views or anything else that has access to the ViewModel.
    
    // this is one way to do it by using a referenced function.
    // private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: makeCardContent) // here private means that only the ViewModel's code can see this model and nobody else. Private Set means that the model is reachable but is view only; no one outside of this ViewModel can't edit but only read this object.
    
    // the other way is as follows where the function is inline
//    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: {(index: Int) -> String in
//        return "😃"
//    })
    // we can rewrite "(index: Int) -> String" to just "index" because Swift knows from context that the type of CardContent is String and for single arguments paranthesis aren't required around the argument's label.
    // we can also omit the return keyword and simplify this even further. hence it becomes: {index in "😃"}
    // finally we can take the function out of the init where it is the second argument and replace index by _ because it is never used and only a constant string is returned and the entire init simplifies to:
    // private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4) { _ in "😃"}
    // this is how it would be possible but we'll actually use the index because we won't return the same emoji everytime.
    
    // FINAL IMPLEMENTATION
    
    private(set) var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
        
        EmojiMemoryGame.emojis[pairIndex]
        
    }
    
    // ref: self and static and property init
    
    var  cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
}
