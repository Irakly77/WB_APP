//
//  Task.swift
//  WB_APP
//
//  Created by Irakli Chachava on 02.08.2024.
//

import Foundation

struct Task: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
    
    // Для упрощения работы
    var data: String {
        return "Task Title: \(title), Task Body: \(body)"
    }
}
