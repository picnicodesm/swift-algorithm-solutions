import Foundation

func solution(_ order:Int) -> Int {
    var result = 0
    
    for c in String(order) {
        switch Int(String(c))! {
            case 3: fallthrough
            case 6: fallthrough
            case 9: result += 1
            default: continue
        }
    }
    
    return result
}