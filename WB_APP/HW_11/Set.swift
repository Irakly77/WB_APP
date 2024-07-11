//
//  Set.swift
//  WB_APP
//
//  Created by Irakli Chachava on 11.07.2024.
//

import Foundation
var set0:Set = [1,2,3,4,5,6,7,8,9,10]
var res0 = set0.remove(4)
var res1 = set0
var res2  = set0.contains(4)

let oddDigits:Set = [1,3,5,7,9]

let evenDigits:Set = [0,2,4,6,8]

let differentDigits:Set = [3,4,7,8]

// здесь мы смотрим пересекаются ли значения двух сетов
let inter = differentDigits.intersection(oddDigits)

// здесь мы объединяем 2 сета
let union = evenDigits.union(oddDigits)

// здесь мы смотрим элементы,которые входят в первое множесто,но не входят во второе
let exclusive = differentDigits.subtracting(oddDigits)

