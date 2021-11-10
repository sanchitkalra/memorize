//
//  ContentView.swift
//  Memorize
//
//  Created by Sanchit Kalra on 04/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis = ["🏎", "🛺", "🚓", "🚈", "🚌", "🚜", "🛴", "🚤", "🛸"] // the automatically inferred type is Array<String>
    
    var carsThemeEmojis = ["🏎", "🛺", "🚓", "🚈", "🚌", "🚜", "🛴", "🚤", "🛸"]
    var animalThemeEmojis = ["🦋", "🐧", "🦊", "🦆", "🐍", "🐊", "🪱", "🐳", "🦄", "🐙"]
    var techThemeEmojis = ["💻", "📽", "📺", "💡", "🪙", "🖥", "📀", "🕹", "⌚️", "🎥"]
    
    @State var emojiCount: Int = 9
    
    var body: some View {
        VStack{
            Text("Memorize").font(.largeTitle).fontWeight(.bold).multilineTextAlignment(.leading)
            ScrollView {
                // LazyVGrid takes the number of columns and creates as many rows as required and arranges the elements as a grid while LazyHGrid takes the number of rows and creates as many columns as required and arranges the elements in a grid.
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) { // adaptive fixes the minimum width for an element and lets it fit the max in the other orientation. Usually the number of elements in the array describes the number of columns. Each GridItem element is individually customisable.
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(isFaceUp: true, content: emoji).aspectRatio(2/3, contentMode: .fit)
                    } // ForEach requires an identifier for each element in the array (the second argument, in this case it i🛴s provided as the element itself because there is no seperate identifier available. Strings do not have identifiers.)
                    // Arrays can be sliced in two ways. 1. [a...b] here both elements at index a and b are included. 2. [a..<b] here element at index a is included but element at index b is not and slice is from a to b-1.
                }
            }
            Spacer()
            HStack{
                carsTheme
//                remove
                Spacer() // A spacer pushes the elements to the ends and occupies any space left in between
//                add
                animalTheme
                Spacer()
                techTheme
            }.font(.largeTitle).padding(.horizontal).foregroundColor(.blue)
        }
        .padding(.horizontal)
        .foregroundColor(.red) // applies these props to all children unless they override it themselves
    }
    
    
    var carsTheme: some View {
        Button {
            emojis = carsThemeEmojis.shuffled()
            emojiCount = emojis.count
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vehicles").font(.body)
            }
        }
    }
    
    var animalTheme: some View {
        Button {
            emojis = animalThemeEmojis.shuffled()
            emojiCount = emojis.count
        } label: {
            VStack {
                Image(systemName: "globe")
                Text("Animals").font(.body)
            }
        }
    }
    
    var techTheme: some View {
        Button {
            emojis = techThemeEmojis.shuffled()
            emojiCount = emojis.count
        } label: {
            VStack {
                Image(systemName: "laptopcomputer")
                Text("Tech").font(.body)
            }
        }
    }
    
//    var remove: some View {
//        Button {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        } label: {
//            Image(systemName: "minus.circle") // derived from SF Symbols
//        }
//    }
//
//    var add: some View {
//        Button {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle") // derived from SF Symbols
//        }
//    }
    
}

struct CardView: View {
    
    // All views in SwiftUI are immutable and the entire UI is rebuilt when logic is applied. All entities like the isFaceUp var are also immutable. To make our logic work we define this var to be a State var (just like how it is in React). Now the var is still immutable but adding the State modifier makes it point to some place in memory and references it. Now we can modify it. This is temporary state and is not persistent. Use other tools for it.
    
    @State var isFaceUp: Bool // all vars must have some value, hence this undefined var must be defined when this component is used (the function is called, see CardView list in HStack). Even if an inital value was given via the assignment operator, the value could be overridden in the function call.
    
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20) // no type decleration is provided here because Swift infers the type itself.
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
