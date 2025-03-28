import Foundation

enum Bonus: String {
    case S, D, T
    
    var bonus: Double {
        switch self {
            case .S: return 1.0
            case .D: return 2.0
            case .T: return 3.0
        }
    }
}

enum Option: String {
    case star = "*"
    case hash = "#"
    
    var effect: Int {
        switch self {
            case .star: return 2
            case .hash: return -1
        }
    }
}

func solution(_ dartResult:String) -> Int {
    var scores: [Int] = [0, 0, 0]
    var set = -1
    var numString = ""
    
    for c in dartResult { 
        var c = String(c)
        if let n = Int(c) {
            numString += c
        } else {            
            // Bonus or Option
            if let bonus = Bonus(rawValue: c) {
                set += 1
                scores[set] = Int(numString)!
                numString = ""
                
                scores[set] = Int(pow(Double(scores[set]), bonus.bonus))
            } else if let option = Option(rawValue: c) {
                scores[set] *= option.effect
                if set != 0 && option == .star {
                scores[set-1] *= option.effect
                }
            }
        }
    }
    
    return scores.reduce(0, +)
}