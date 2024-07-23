import SwiftUI

struct ContentView: View {
    @StateObject var taskManager: TaskManager
    @State private var newTaskTitle: String = ""
    var taskService: TaskService
    
    init(taskService: TaskService) {
        self.taskService = taskService
        self._taskManager = StateObject(wrappedValue: TaskManager.shared)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter a new task", text: $newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    self.taskService.addTask(title: self.newTaskTitle)
                    self.newTaskTitle = ""
                }) {
                    Text("Add Task")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                List {
                    ForEach(taskManager.tasks) { task in
                        TaskRow(task: task, taskService: self.taskService)
                    }
                }
            }
            .navigationBarTitle("To-Do List")
        }
        .onAppear {
            self.taskManager.objectWillChange.send()
        }
    }
}

struct TaskRow: View {
    @ObservedObject var task: Task
    var taskService: TaskService
    
    var body: some View {
        HStack {
            Text(task.title)
                .foregroundColor(task.isCompleted ? .gray : .black)
            
            Spacer()
            
            Button(action: {
                self.taskService.toggleTaskCompletion(task: self.task)
            }) {
                Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                    .imageScale(.large)
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskService: DefaultTaskService())
    }
}
