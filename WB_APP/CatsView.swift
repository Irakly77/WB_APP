//
//  CatsView.swift
//  WB_APP
//
//  Created by Irakli Chachava on 07.08.2024.
//

import SwiftUI
import APICats
struct CatsView: View {
    @Binding var articles: Articales

    var body: some View {
        VStack {
            AsyncImage(url: articles.articales)
        }
    }
}
