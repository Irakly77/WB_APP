import Foundation
import SwiftUI
struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
       
        Button("Закрыть") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
