import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ClientViewModel()

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.tasks) { task in
                    Text(task.title) // Отображаем заголовок задачи
                }
                Button(action: {
                    viewModel.processTasks() // Запускаем процесс обработки задач
                }) {
                    Text("Process Tasks")
                }
                .padding()
            }
            .navigationTitle("Tasks")
        }
    }
}
#Preview {
    ContentView()
}
