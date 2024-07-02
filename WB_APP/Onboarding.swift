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
                .foregroundStyle(.color1)
            
            Button(action: {}){
                Text("agree")
                    .font(.custom("SF Pro Display", size: 14))
                    .foregroundStyle(.color1)
            }
            .padding(.top,158)
            Button(action: {self.showingSheet = true}) {
                Text("start")
                    .font(.custom("SF Pro Display", size: 16))
                    .foregroundStyle(.color3)
            }
            .frame(width: 327,height: 52)
            .background(.color2)
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
