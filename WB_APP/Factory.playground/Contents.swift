import Foundation

class Passport {
    var series: String
    var number: String
    var date: Date
    var year: Int
    var month: Int
    var day: Int
    weak var owner: Person?
    
    init(series: String, number: String, year: Int, month: Int, day: Int, owner: Person?) {
        self.series = series
        self.number = number
        self.year = year
        self.month = month
        self.day = day
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        self.date = Calendar.current.date(from: dateComponents) ?? Date()
        self.owner = owner
        print(#file,#line,"Паспорт инициализирован: \(series) \(number) \(year)-\(month)-\(day)")
    }
    
    deinit {
        print(#file,#line,"Паспорт деинициализирован: \(series) \(number) \(year)-\(month)-\(day)")
    }
}

class Person {
    var fullName: String
    var age: Int
    var passport: Passport?
    
    init(fullName: String, age: Int) {
        self.fullName = fullName
        self.age = age
        print(#file,#line,"Человек инициализирован: \(fullName)")
    }
    
    deinit {
        print(#file,#line,"Человек деинициализирован: \(fullName)")
    }
}

var person: Person? = Person(fullName: "Иванов Иван Иванович", age: 24)
var passport: Passport? = Passport(series: "7777", number: "98765", year: 2020, month: 2, day: 14, owner: person)

person?.passport = passport
person = nil
passport = nil

