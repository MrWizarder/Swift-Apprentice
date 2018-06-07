//: Playground - noun: a place where people can play

import UIKit


//// Problems introduced by lack of access control




//let account = BasicAccount()
//account.deposit(amount: 10.00)
//account.withdraw(amount: 5.00)
////account.balance = 1000000.00
//
//
////// Introducing access control
//
//
//
//// Create a checking account for John. Deposit $300.00
//let johnChecking = CheckingAccount()
//johnChecking.deposit(amount: 300.0)
//
//// Write a check for $200.00
//let check = johnChecking.writeCheck(amount: 200.0)!
//
//// Create a checking account for Jane, and deposit the check.
//let janeChecking = CheckingAccount()
//janeChecking.deposit(check)
//janeChecking.balance
//
//// Try to cash the check again. Of course, it had no effect on
//// Jane's balance this time :]
//janeChecking.deposit(check)
//janeChecking.balance
//check.account


//// Fileprivate


//// Internal, public, and open

//// Internal

let johnChecking = CheckingAccount()
johnChecking.deposit(amount: 300.0)
johnChecking.description


class SavingsAccount: BasicAccount {
    var interestRate: Double
    
    init(interestRate: Double) {
        self.interestRate = interestRate
    }
    
    func processInterest() {
        let interest = balance * interestRate
        deposit(amount: interest)
    }
}


let savings = SavingsAccount(interestRate: 100.0)
savings.interestRate
savings.processInterest()
savings.interestRate



//// Organizing code into extensions


//// Extensions by protocol conformance

