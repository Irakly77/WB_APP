//
//  DIctionary.swift
//  WB_APP
//
//  Created by Irakli Chachava on 11.07.2024.
//

import Foundation
var city:Dictionary = ["Moscow":13000000,"Paris":2100000,"Berlin":3600000,"London":9000000 ]
// добавляем  2 элемента
 var city0 = city["Madrid"] = 3200000
 var city1 = city["Lisboa"] = 504718
//удаляем элемент
 var city2 = city.removeValue(forKey: "London")
// обновляем значение
 var city3 = city.updateValue(3000000, forKey: "Paris")
//получаем значение
 var city4 = city["Moscow"]
