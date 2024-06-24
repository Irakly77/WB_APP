//
//  UserDefaultsWater.swift
//  WB_APP
//
//  Created by Irakli Chachava on 24.06.2024.
//

import Foundation

final class UserDefaultsWater {
    static let shared = UserDefaultsWater()
    
    func addWater() {
        let data  = UserDefaults.standard
        let water = data.double(forKey: "water")
        data.setValue(water + 500, forKey: "water")
    }
    func currentDouble()-> Double {
        let data = UserDefaults.standard.double(forKey: "water")
        return data
    }
}
