import Foundation

func solution(_ orders:[String]) -> Int {
    var result = 0
    let menu = ["americano": 4500, "cafelatte": 5000]
    
    for order in orders {
        if order.contains("americano") {
            result += menu["americano"]!
        } else if order.contains("cafelatte") {
            result += menu["cafelatte"]!
        } else {
            result += menu["americano"]!
        }
    }
    
    return result
}