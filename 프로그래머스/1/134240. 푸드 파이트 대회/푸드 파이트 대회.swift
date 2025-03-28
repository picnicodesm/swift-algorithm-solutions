import Foundation

func solution(_ food:[Int]) -> String {
    var line1 = ""
    var line2 = ""
    
    for index in 1..<food.count {
        line1 += String(repeating: "\(index)", count: food[index] / 2)
    }
    
    for c in line1.reversed() {
        line2 += String(c)
    }
    
    return line1 + "0" + line2
}