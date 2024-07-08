//
//  Position.swift
//  WB_APP
//
//  Created by Irakli Chachava on 08.07.2024.
//

import Foundation

enum Position:CaseIterable {
    case firts
    case second
    case third
    case four
    static var  random: Position {
        return Position.allCases.randomElement() ?? .firts
    }
}
