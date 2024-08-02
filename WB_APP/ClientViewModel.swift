//
//  ClientViewModel.swift
//  WB_APP
//
//  Created by Irakli Chachava on 02.08.2024.
//

import Foundation
import Combine

class ClientViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var results: [Result] = []

    private var cancellables = Set<AnyCancellable>()
    private let serverURL = URL(string: "https://jsonplaceholder.typicode.com")!

    init() {
        fetchTasks() // Загружаем задачи при инициализации
    }

    // Получение задач с сервера
    func fetchTasks() {
        let url = serverURL.appendingPathComponent("/posts")
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Task].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .assign(to: &$tasks) // Используем Combine для обновления состояния
    }

    // Обработка задач
    func processTasks() {
        print("Processing tasks...") // Для отладки
        for task in tasks {
            let result = Result(taskId: task.id, processedData: "\(task.data) processed.")
            results.append(result)
            sendResult(result)
        }
    }

    // Отправка результата на сервер
    func sendResult(_ result: Result) {
        let url = serverURL.appendingPathComponent("/posts") // URL для отправки
        print("Sending result for task ID: \(result.taskId)") // Для отладки

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(result)
            request.httpBody = jsonData

            URLSession.shared.dataTask(with: request) { _, response, error in
                if let error = error {
                    print("Error sending result: \(error.localizedDescription)")
                } else {
                    print("Result sent successfully!")
                }
            }.resume()
        } catch {
            print("Error encoding result: \(error.localizedDescription)")
        }
    }
}
