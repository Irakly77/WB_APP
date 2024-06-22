import Foundation

class BankAccount {
    var balance: Double
    var name: String
    
    init(name: String, initialBalance: Double) {
        self.name = name
        self.balance = initialBalance
    }
    
    func deposit(amount: Double) {
        balance += amount
    }
    
    func transfer(amount: Double, to account: BankAccount) {
        if balance >= amount {
            balance -= amount
            account.deposit(amount: amount)
        } else {
            print("Недостаточно средств для перевода.")
        }
    }
}

class Bank {
    var accounts: [BankAccount] = []
    
    func addAccount(account: BankAccount) {
        accounts.append(account)
    }
    
    func printAccounts() {
        for account in accounts {
            print("Баланс счета \(account.name): \(account.balance)")
        }
    }
}

let bank = Bank()
let account1 = BankAccount(name: "Основной", initialBalance: 1000)
let account2 = BankAccount(name: "Сберегательный", initialBalance: 500)

bank.addAccount(account: account1)
bank.addAccount(account: account2)

print("Состояние счетов до операций:")
bank.printAccounts()

account2.deposit(amount: 100)
account1.transfer(amount: 400, to: account2)

print("Состояние счетов после операций:")
bank.printAccounts()
