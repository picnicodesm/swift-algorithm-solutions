import Foundation

func solution(_ bin1:String, _ bin2:String) -> String {
    let n1 = Int(bin1, radix: 2)!
    let n2 = Int(bin2, radix: 2)!
    let result = n1 + n2
    
    return String(result, radix: 2)
}