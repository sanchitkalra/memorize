//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sanchit Kalra on 04/11/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
