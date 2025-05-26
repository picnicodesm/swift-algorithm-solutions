import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {

    var result: [Int] = []
    var index = 0
    var shoot = 0
    var progresses = progresses
    
    while index < progresses.count {
        for i in index..<speeds.count {
            progresses[i] += speeds[i]
        }
    
        if progresses[index] >= 100 {
            shoot = 0
            while index < progresses.count && progresses[index] >= 100 { 
                shoot += 1
                index += 1
            }
            result.append(shoot)
        }
    }
    
    return result
}