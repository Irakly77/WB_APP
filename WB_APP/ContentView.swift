import SwiftUI
import MyCustomButton

struct ContentView: View {
    @State private var textFieldContent = ""
    
    var body: some View {
        VStack {
            MyCustomTextField(text: $textFieldContent, placeholder: "Enter text")
                .padding()
            
            MyCustomButton(title: "Press Me") {
                print("Button pressed!")
            }
            .padding()
        }
    }
}



#Preview {
    ContentView()
}
