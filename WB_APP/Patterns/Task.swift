//
//  Task.swift
//  WB_APP
//
//  Created by Irakli Chachava on 23.07.2024.
//

import Foundation

class Task: Identifiable, ObservableObject {
    let id = UUID()
    @Published var title: String
    @Published var isCompleted: Bool = false
    
    init(title: String) {
        self.title = title
    }
}
