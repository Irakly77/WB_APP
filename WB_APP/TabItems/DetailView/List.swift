import SwiftUI

struct Lists: View {
    @State private var selection: String?
    
    let names = ["Анастасия Иванова", "Петя", "Маман", "Арбуз Дыня", "Иван Иванов", "Лиса Алиса"]
    let additionally = ["last seen yesterday", "Online", "Last seen 3 hours ago", "Online", "Online", "Last seen 30 minutes ago"]
    
    let photoNames = ["avatar1", "avatar2", "avatar3", "avatar4", "avatar5", "avatar6"]
    
    var body: some View {
        List {
            ForEach(Array(zip(names.indices, names)), id: \.0) { index, name in
                Button(action: {
                    self.selection = name
                }) {
                    HStack {
                        // Используем AsyncImageView для загрузки изображения из ассетов
                        AsyncImageView(imageName: photoNames[index])
                            .frame(width: 56, height: 56)
                        
                        VStack(alignment: .leading) {
                            Text(name)
                                .font(.headline)
                            Text(additionally[index])
                                .font(.subheadline)
                        }
                    }
                }
                .background(
                    NavigationLink(destination: Detail(name: name, status: additionally[index], photo: photoNames[index]), tag: name, selection: $selection) {
                        EmptyView()
                    }
                        .hidden()
                )
            }
        }
        .foregroundColor(.black)
    }
}

#Preview {
    Lists()
}

