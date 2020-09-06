//
//  GameModel.swift
//  Memorize
//
//  Created by Артур Чернов on 9/6/20.
//  Copyright © 2020 Артур Чернов. All rights reserved.
//

import Foundation

struct GameModel<CardContent> {
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
    
    var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
}
