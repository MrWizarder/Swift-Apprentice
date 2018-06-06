//: Playground - noun: a place where people can play

import UIKit


//// Problems introduced by lack of access control

protocol Account {
    associatedtype Currency
    
    var balance: Currency { get }
    func deposit(amount: Currency)
    func withdraw(amount: Currency)
}

typealias Dollars = Double

class BasicAccount: Account {
    
    private(set) var balance: Dollars = 0.0
    
    func deposit(amount: Double) {
        balance += amount
    }
    
    func withdraw(amount: Double) {
        if amount <= balance {
            balance -= amount
        } else {
            balance = 0
        }
    }
}

let account = BasicAccount()
account.deposit(amount: 10.00)
account.withdraw(amount: 5.00)
//account.balance = 1000000.00


//// Introducing access control

class CheckingAccount: BasicAccount {
    private let accountNumber = UUID().uuidString
    
    class Check {
        let account: String
        var amount: Dollars
        private(set) var cashed = false
        
        func cash() {
            cashed = true
        }
        
        init(amount: Dollars, from account: CheckingAccount) {
            self.amount = amount
            self.account = account.accountNumber
        }
    }
    
    func writeCheck(amount: Dollars) -> Check? {
        guard balance > amount else {
            return nil
        }
        
        let check = Check(amount: amount, from: self)
        withdraw(amount: check.amount)
        return check
    }
    
    func deposit(_ check: Check) {
        guard !check.cashed else {
            return
        }
        
        deposit(amount: check.amount)
        check.cash()
    }
}


// Create a checking account for John. Deposit $300.00
let johnChecking = CheckingAccount()
johnChecking.deposit(amount: 300.0)

// Write a check for $200.00
let check = johnChecking.writeCheck(amount: 200.0)!

// Create a checking account for Jane, and deposit the check.
let janeChecking = CheckingAccount()
janeChecking.deposit(check)
janeChecking.balance

// Try to cash the check again. Of course, it had no effect on
// Jane's balance this time :]
janeChecking.deposit(check)
janeChecking.balance


