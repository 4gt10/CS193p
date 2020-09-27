//
//  ContentViewModel.swift
//  Memorize
//
//  Created by Артур Чернов on 9/6/20.
//  Copyright © 2020 Артур Чернов. All rights reserved.
//

import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published private var model: GameModel<String> = createGame()
        
    static func createGame() -> GameModel<String> {
        let emojis = ["👻", "🎃", "🕷"]
        return GameModel(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Accessors
    
    var cards: [GameModel<String>.Card] {
        model.cards
    }
    
    // MARK: - Intents
    
    func choose(card: GameModel<String>.Card) {
        model.choose(card: card)
    }
}
