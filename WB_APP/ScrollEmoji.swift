//
//  ScrollView.swift
//  WB_APP
//
//  Created by Irakli Chachava on 08.07.2024.
//

import SwiftUI

struct ScrollEmoji: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [GridItem()]) {
                ForEach(0...10000,id: \.self) { _ in
                    ZStack {
                        Text((String(UnicodeScalar(Array(0x1F300...0x1F3F0).randomElement()!)!)))
                            .font(.system(size: 100))
                            .opacity(0.5)
                        CellFigure(position: Position.random)
                        
                    }
                }
            }
        }
    }
}
#Preview {
    ScrollEmoji()
}
