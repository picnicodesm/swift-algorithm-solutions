import Foundation

func solution(_ polynomial:String) -> String {
    
    let items = polynomial.split(separator: " ")
    var result: [Int] = [0, 0]
    
    for item in items {
        if item.contains("x") {
            if item == "x" {
                result[0] += 1
            } else {
                let nStr = item.split(separator: "x")
                if let n = Int(nStr.first!) {
                    result[0] += n    
                }
            }
            
        } else if let n = Int(item) {
            result[1] += n
        }
    }
    
    
    
    if result[0] != 0 && result[1] != 0 {
        if result[0] == 1 {
            return "x + \(result[1])"
        } else {
            return "\(result[0])x + \(result[1])"
        }
    } else if result[0] != 0 {
        if result[0] == 1 {
            return "x"
        } else {
            return "\(result[0])x"
        }
    } else {
        return "\(result[1])"
    }
}