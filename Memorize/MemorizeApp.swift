//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sanchit Kalra on 04/11/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame() // this is an instance of the viewmodel that is then passed down to the content view which is the main view for our app.
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game) // this var (viewModel) was uninitialised in the ContentView, hence needs to be passed here.
        }
    }
}
