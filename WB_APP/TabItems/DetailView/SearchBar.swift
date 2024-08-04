//
//  SearchBar.swift
//  WB_APP
//
//  Created by Irakli Chachava on 14.06.2024.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchText = ""
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("Search", text: $searchText)
                .padding(.leading, 30) // Добавляем место для иконки лупы
                .padding(6)
                .background(Color(.systemGray6))
                .cornerRadius(4)
                .frame(width: 327, height: 36)
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 8) // Отступ для иконки лупы
        }
       
        
        
    }
}

#Preview {
    SearchBar()
}
