//
//  TaskService.swift
//  WB_APP
//
//  Created by Irakli Chachava on 23.07.2024.
//

import Foundation

protocol TaskService {
    func addTask(title: String)
    func toggleTaskCompletion(task: Task)
    var tasks: [Task] { get }
}

class DefaultTaskService: TaskService {
    private var taskManager: TaskManager
    
    init(taskManager: TaskManager = .shared) {
        self.taskManager = taskManager
    }
    
    func addTask(title: String) {
        taskManager.addTask(title: title)
    }
    
    func toggleTaskCompletion(task: Task) {
        taskManager.toggleTaskCompletion(task: task)
    }
    
    var tasks: [Task] {
        taskManager.tasks
    }
}
