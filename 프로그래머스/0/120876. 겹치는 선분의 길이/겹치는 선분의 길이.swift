import Foundation

func solution(_ lines:[[Int]]) -> Int {
    var result = 0
    var min = 100
    var max = -100
    
    for line in lines {
        if line[0] < min { min = line[0] }
        if line[0] > max { max = line[0] }
        if line[1] < min { min = line[1] }
        if line[1] > max { max = line[1] }
    }
    
    var used = Array(repeating: 0, count: max - min)
    
    for line in lines {
        for i in line[0]..<line[1] {
            let index = i - min
            used[index] += 1
        }
    }
    
    return used.filter({ $0 > 1 }).count
}