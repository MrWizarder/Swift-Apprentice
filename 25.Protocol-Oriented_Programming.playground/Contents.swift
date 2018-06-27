//: Playground - noun: a place where people can play

import UIKit


//// Introducing protocol extensions


extension String {
    func shout() {
        print(uppercased())
    }
}

"Swift is pretty cool".shout()


protocol TeamRecord {
    var wins: Int { get }
    var losses: Int { get }
    var winningPercentage: Double { get }
}

extension TeamRecord {
    var gamesPlayed: Int {
        return wins + losses
    }
}


struct BaseBallRecord: TeamRecord {
    var wins: Int
    var losses: Int
    
    var winningPercentage: Double {
        return Double(wins) / Double(wins + losses)
    }
}

let sanFranciscoSwifts = BaseBallRecord(wins: 10, losses: 5)
sanFranciscoSwifts.gamesPlayed



//// Default implementations

struct BasketballRecord: TeamRecord {
    var wins: Int
    var losses: Int
    let seasonLength = 82
    
//    var winningPercentage: Double {
//        return Double(wins) / Double(wins + losses)
//    }
}

extension TeamRecord {
    var winningPercentage: Double {
        return Double(wins) / Double(wins + losses)
    }
}

let minneapolisFunctors = BaseBallRecord(wins: 60, losses: 22)
minneapolisFunctors.winningPercentage


struct HockeyRecord: TeamRecord {
    var wins: Int
    var losses: Int
    var ties: Int
    
    // Hockey record introduces ties, and has
    // its own implementation of winningPercentage
    var winningPercentage: Double {
        return Double(wins) / Double(wins + losses + ties)
    }
}

let chicagoOptionals = BaseBallRecord(wins: 10, losses: 6)
let phoenixStridables = HockeyRecord(wins: 8, losses: 7, ties: 1)
chicagoOptionals.winningPercentage
phoenixStridables.winningPercentage


//// Mini-exercise

extension CustomStringConvertible {
    var description: String {
        return "Remember to implement CustomStringConvertible!"
    }
}

struct MyStruct: CustomStringConvertible {
    
}
print(MyStruct())





//// Understanding protocol extension dispatching

// static dispatching           dynamic dispatching

protocol WinLoss {
    var wins: Int { get }
    var losses: Int { get }
}

extension WinLoss {
    var winningPercentage: Double {
        return Double(wins) / Double(wins + losses)
    }
}

struct CricketRecord: WinLoss {
    var wins: Int
    var losses: Int
    var draws: Int
    
    var winningPercentage: Double {
        return Double(wins) / Double(wins + losses + draws)
    }
}

let miamiTuples = CricketRecord(wins: 8, losses: 7, draws: 1)
let winLoss: WinLoss = miamiTuples

miamiTuples.winningPercentage
winLoss.winningPercentage






//// Type constraints

protocol PostSeasonEligible {
    var minimumWinsForPlayoffs: Int { get }
}

extension TeamRecord where Self: PostSeasonEligible {
    var isPlayoffEligible: Bool {
        return wins > minimumWinsForPlayoffs
    }
}



protocol Tieable {
    var ties: Int { get }
}

extension TeamRecord where Self: Tieable {
    var winningPercentage: Double {
        return Double(wins) / Double(wins + losses + ties)
    }
}


struct RugbyRecord: TeamRecord, Tieable {
    var wins: Int
    var losses: Int
    var ties: Int
}

let rugbyRecord = RugbyRecord(wins: 8, losses: 7, ties: 1)
rugbyRecord.winningPercentage



//// Mini-exercise


extension CustomStringConvertible where Self: TeamRecord {
    var description: String {
        return "\(wins) - \(losses)"
    }
}

struct TestRecord: CustomStringConvertible, TeamRecord {
    var wins: Int
    var losses: Int
}
let testRecord = TestRecord(wins: 10, losses: 5)
print(testRecord)





//// Protocol-oriented benefits


//// Programming to interfaces, not implementations

class TeamRecordBase {
    var wins = 0
    var losses = 0
    
    var winningPercentage: Double {
        return Double(wins) / Double(wins + losses)
    }
}

// Will not compile: inheritance is only possible with classes.
//struct BaseBallRecord : TeamRecordBase {
//
//}

//class HockeyRecord: TeamRecordBase {
//    var ties = 0
//
//    override var winningPercentage: Double {
//        return Double(wins) / Double(wins + losses + ties)
//    }
//}


class TieableRecordBase: TeamRecordBase {
    var ties = 0
    
    override var winningPercentage: Double {
        return Double(wins) / Double(wins + losses + ties)
    }
}

//class HockeyRecord: TieableRecordBase {
//}
//class CricketRecord: TieableRecordBase {
//}

extension TieableRecordBase {
    var totalPoints: Int {
        return (2 * wins) + (1 * ties)
    }
}



//// Traits, mixins, and multiple inheritance

protocol TieableRecord {
    var ties: Int { get }
}

protocol DivisionalRecord {
    var divisionalWins: Int { get }
    var divisionalLosses: Int { get }
}

protocol ScoreableRecord {
    var totalPoints: Int { get }
}


extension ScoreableRecord where Self: TieableRecord, Self: TeamRecord {
    var totalPoints: Int {
        return (2 * wins) + (1 * ties)
    }
}

struct NewHockeyRecord: TeamRecord, TieableRecord, DivisionalRecord, CustomStringConvertible, Equatable {
    var wins: Int
    var losses: Int
    var ties: Int
    var divisionalWins: Int
    var divisionalLosses: Int
    
    var description: String {
        return "\(wins) - \(losses) - \(ties)"
    }
    
    static func ==(lhs: NewHockeyRecord, rhs: NewHockeyRecord) -> Bool {
        return lhs.wins == rhs.wins &&
            lhs.ties == rhs.ties &&
            lhs.losses == rhs.losses
    }
}


//// Simplicity


//var winningPercentage: Double {
//    var percent = Double(wins) / Double(wins + losses)
//
//    // Oh no! Not relevant!
//    above500 = percent > 0.5
//
//    return percent
//}




//// Why Swift is a protocol-oriented language





