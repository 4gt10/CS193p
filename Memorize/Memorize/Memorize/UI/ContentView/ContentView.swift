//
//  ContentView.swift
//  Memorize
//
//  Created by Артур Чернов on 9/6/20.
//  Copyright © 2020 Артур Чернов. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel: ContentViewModel
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
            .foregroundColor(.orange)
            .padding()
    }
}

struct CardView: View {
    var card: GameModel<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill()
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
