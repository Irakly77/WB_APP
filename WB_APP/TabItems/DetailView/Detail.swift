import SwiftUI
struct Detail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var name: String
    var status: String
    var photo: String
    var body: some View {
        
        VStack {
            Image(photo)
                .resizable()
                .frame(width: 200,height: 200)
                .padding(.top,46)
            Text(name)
                .font(.system(size: 24))
                .padding(.top,26)
            Text("+7 999 999-99-99")
                .font(.system(size: 16))
                .padding(.top,4)
            HStack {
                Image("X")
                Image("Instagram")
                Image("LinkedIn")
                Image("Facebook")
            }
            .padding(.top,40)
            Spacer()
            // Возвращение назад
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrowshape.turn.up.backward")
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                    Text("Назад")
                    
                    
                    
                })
                .navigationBarItems(trailing: Button(action: {
                })  {
                    Image(systemName: "pencil")
                })
        }
    }
}
    #Preview {
        Detail(name: "Маман", status: "+7 999 999-99-99",photo: "Арбуз Дыня")
    }
    
