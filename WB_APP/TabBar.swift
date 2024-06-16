import SwiftUI
struct TabBar: View {
    var body: some View {
        TabView {
            Contacts()
                .tabItem {
                    Image(systemName: "person.2")
                }
            Chats()
                .tabItem {
                    Image(systemName: "message")
                }
            Other()
                .tabItem {
                    Image(systemName: "ellipsis")
                }
        }
    }
}

#Preview {
    TabBar()
}
