import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    let orderedOrder = d.sorted()
    var count = 0
    var used = 0
    
    for money in orderedOrder {
        used += money
        if used > budget {
            break
        }
        count += 1
    }
    
    return count
}