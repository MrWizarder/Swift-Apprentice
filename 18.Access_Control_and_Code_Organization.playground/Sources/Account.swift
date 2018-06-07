import Foundation

public protocol Account {
    associatedtype Currency
    
    var balance: Currency { get }
    func deposit(amount: Currency)
    func withdraw(amount: Currency)
}


public typealias Dollars = Double

open class BasicAccount: Account {
    
    public init() { }
    public var balance: Dollars = 0.0
    
    public func deposit(amount: Double) {
        balance += amount
    }
    
    public func withdraw(amount: Double) {
        if amount <= balance {
            balance -= amount
        } else {
            balance = 0
        }
    }
}
