import Foundation

func solution(_ binomial:String) -> Int {
    let bi = binomial.split(separator: " ").map { String($0) }
    let (a, op, b) = (Int(bi[0])!, bi[1], Int(bi[2])!)
    
    if op == "+" { return a + b }
    else if op == "-" { return a - b }
    else { return a * b }
}