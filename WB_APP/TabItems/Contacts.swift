import SwiftUI
struct Contacts: View {
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar()
                Lists()
                    .padding(.leading, 15)
                    .listStyle(.inset)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                    }) {
                        Text("Контакты")
                            .font(.system(size:18))
                            .foregroundColor(.black)
                            .padding(.leading,19)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .padding(.trailing,16)
                    }
                }
            }
        }
        
    }
}
#Preview {
    Contacts()
}
