//
//  CellFigure.swift
//  WB_APP
//
//  Created by Irakli Chachava on 08.07.2024.
//

import SwiftUI

struct CellFigure: View {
    var position: Position
    var body: some View  {
        ZStack {
            switch position {
            case .firts:
                firstPosition
            case .second:
                secondPostion
            case .third:
                thirdPostion
            case .four:
                fourPostion
            }
        }
    }
    private var firstPosition: some View {
        HStack {
            VStack{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [10]))
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [10]))
                    .frame(width: 100, height: 100)
            }
            .padding()
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [10]))
                    .frame(width: 100, height: 200)
            }
        }
    }
    private var secondPostion: some View {
        VStack {
            HStack{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [10]))
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [10]))
                    .frame(width: 100, height: 100)
            }
            .padding()
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [10]))
                    .frame(width: 200, height: 100)
            }
        }
    }
    private var thirdPostion: some View {
        HStack {
            VStack{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [10]))
                    .frame(width: 100, height: 200)
            }
            .padding()
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [10]))
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [10]))
                    .frame(width: 100, height: 100)
            }
        }
    }
    private var fourPostion: some View {
        VStack {
            HStack{
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [10]))
                    .frame(width: 200, height: 100)
            }
            .padding()
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [10]))
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [10]))
                    .frame(width: 100, height: 100)
            }
        }
    }
}
#Preview {
    CellFigure(position: .four)
}
