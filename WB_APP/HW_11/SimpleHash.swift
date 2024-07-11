//
//  SimpleHash.swift
//  WB_APP
//
//  Created by Irakli Chachava on 11.07.2024.
//

import Foundation

//Эта хеш-функция складывает значения Юникода всех символов в строке, создавая единое числовое значение. Оно может использоваться для быстрого сравнения строк на равенство
func simpleHash(string: String) -> Int {
    var hash = 0
    for char in string.utf8 {
        hash += Int(char)
    }
    return hash
}

func testHash() {
    let string1 = "Hello, world!"
    let string2 = "Hello, world!"
    
    if simpleHash(string: string1) == simpleHash(string: string2) {
        print("Strings are equal")
    } else {
        print("Strings are not equal")
    }
}
let results = testHash()
