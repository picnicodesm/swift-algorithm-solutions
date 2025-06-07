import Foundation

func solution(_ order:[Int]) -> Int {
    var queue: [Int] = Array(1...order.count).reversed()
    var temp: [Int] = []
    var result = 0
    var index = 0

    while index < order.count { 
        var next = order[index]
        
        if !temp.isEmpty && temp.last! == next {
            temp.removeLast()
            result += 1
            index += 1
            continue
        }
        
        if !queue.isEmpty {
            if queue.last! == next {
                queue.removeLast()
                result += 1
                index += 1
                continue
            } else {
                temp.append(queue.removeLast())
                continue
            }
        } else { return result }
    }
    
    return result
}