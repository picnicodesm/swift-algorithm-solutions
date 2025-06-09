import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
   if x == y { return 0 }

    var queue: [(Int, Int)] = [(x, 0)] 
    var index = 0
    var visited = Set<Int>()
    visited.insert(x)
    
    while index < queue.count {
        let (current, steps) = queue[index]
        index += 1
        
        for next in [current + n, current * 2, current * 3].reversed() {
            if next == y {
                return steps + 1
            }
            if next < y && !visited.contains(next) {
                visited.insert(next)
                queue.append((next, steps + 1))
            }
        }
    }
    
    return -1
}