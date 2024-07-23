//
//  TaskManager.swift
//  WB_APP
//
//  Created by Irakli Chachava on 23.07.2024.
//

import Foundation
import SwiftUI

class TaskManager: ObservableObject {
    
    static let shared = TaskManager()
    
    @Published var tasks: [Task] = []
    
    private init() {}
    
    func addTask(title: String) {
        let task = Task(title: title)
        tasks.append(task)
    }
    
    func toggleTaskCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}
