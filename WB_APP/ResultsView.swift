//
//  ViewResults.swift
//  WB_APP
//
//  Created by Irakli Chachava on 02.08.2024.
//

import SwiftUI

struct ResultView: View {
    @Binding var results: [Result] // Привязка к массиву результатов
    
    var body: some View {
        List(results, id: \.taskId) { result in
            Text(result.processedData) // Отображаем обработанные результаты
        }
        .navigationTitle("Results")
    }
}
