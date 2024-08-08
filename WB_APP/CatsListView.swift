//
//  CatsListView.swift
//  WB_APP
//
//  Created by Irakli Chachava on 07.08.2024.
//

import SwiftUI
import APICats

struct CatsListView: View {
    @State private var articles: [Articales] = Array(repeating: Articales(), count: 50)

    var body: some View {
        List {
            ForEach(articles.indices, id: \.self) { index in
                CatsView(articles: $articles[index])
                    .frame(height: 200)
                    .onAppear {
                        randomCat(for: index)
                    }
            }
        }
    }

    private func randomCat(for index: Int) {
        articles[index].loadingCats { data, error in
            if let data = data {
                articles[index].articales = data
            }
        }
    }
}

#Preview {
    CatsListView()
}
