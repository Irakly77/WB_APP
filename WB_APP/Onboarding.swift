import SwiftUI
struct Onboarding: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingSheet = false
    var body: some View {
        VStack {
            Image("man")
                .frame(width: 262,height: 271)
                .padding(.top, 135)
            
            Text("communicate")
                .font(.custom("SF Pro Display", size: 24))
                .multilineTextAlignment(.center)
                .padding(.top,42)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(Color(red: 41/255, green: 24/255, blue: 59/255,opacity: 1))
            
            Button(action: {}){
                Text("agree")
                    .font(.custom("SF Pro Display", size: 14))
                    .foregroundColor(Color(red: 41/255, green: 24/255, blue: 59/255,opacity: 1))
            }
            .padding(.top,158)
            Button(action: {self.showingSheet = true}) {
                Text("start")
                    .font(.custom("SF Pro Display", size: 16))
                    .foregroundColor(Color(red: 247/255, green: 247/255, blue: 252/255,opacity: 1))
            }
            .frame(width: 327,height: 52)
            .background(Color(red: 154/255, green: 65/255, blue: 254/255,opacity: 1))
            .cornerRadius(30)
            .padding(.top,18)
            .sheet(isPresented: $showingSheet) {
                ModalView()
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
