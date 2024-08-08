//
//  Articles.swift
//  WB_APP
//
//  Created by Irakli Chachava on 07.08.2024.
//

import Foundation
import APICats

struct Articales {
    var articales: URL? = nil
    
    init(){}
    
    mutating func loadingCats(completion: @escaping (_ data: URL?, _ error: Error?) -> Void) {
        CatsAPI.catGet(id: "cat") { data,error in
            completion(data,error)
        }
    }
}
