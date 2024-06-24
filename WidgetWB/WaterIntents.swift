//
//  WaterIntents.swift
//  WB_APP
//
//  Created by Irakli Chachava on 24.06.2024.
//

import AppIntents

final class WaterIntents: AppIntent {
    
    
    static var title:  LocalizedStringResource = "Количесто миллилитров выпитой воды"
    
    func perform() async throws -> some IntentResult {
        UserDefaultsWater.shared.addWater()
        return .result()
    }
    
    
}

