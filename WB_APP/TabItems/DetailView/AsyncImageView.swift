//
//  AsyncImageView.swift
//  WB_APP
//
//  Created by Irakli Chachava on 04.08.2024.
//


import Foundation
import SwiftUI

struct AsyncImageView: View {
    var imageName: String
    var placeholder: AnyView
    
    init(imageName: String, placeholder: some View = Color.gray) {
        self.imageName = imageName
        self.placeholder = AnyView(placeholder)
    }
    
    var body: some View {
        Group {
            if let uiImage = UIImage(named: imageName) {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}

