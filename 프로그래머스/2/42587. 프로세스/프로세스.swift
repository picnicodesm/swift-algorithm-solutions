import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = priorities
    var flag = false
    var result = 0
    var currentLocation = location

    while currentLocation >= 0 {
        flag = false
        let currentProcessPriority = queue.removeFirst()
        for i in 0..<queue.count { 
            if queue[i] > currentProcessPriority { 
                flag = true
                break
            }
        }
        
        if flag { 
            queue.append(currentProcessPriority) 
            if currentLocation == 0 { currentLocation = queue.count-1 }
            else { currentLocation -= 1 }
        } else { 
            result += 1
            currentLocation -= 1
        }

    }
    
    return result
}