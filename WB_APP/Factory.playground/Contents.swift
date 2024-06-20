import Foundation

class Passport {
    var series: String
    var number: String
    var Date: Date
    weak var owner: Person?
    
    init(series: String, number: String, Date: Date, owner: Person?) {
        self.series = series
        self.number = number
        self.Date = Date
        self.owner = owner
        print(#file,#line,"Паспорт инициализирован: \(series) \(number)")
    }
    
    deinit {
        print(#file,#line,"Паспорт деинициализирован: \(series) \(number)")
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
var passport: Passport? = Passport(series: "7777", number: "987654", Date: Date(), owner: person)
person?.passport = passport

person = nil
passport = nil
