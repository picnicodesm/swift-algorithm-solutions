import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var index1 = 0
    var index2 = 0
    var goalIndex = 0
    
    for goalIndex in 0..<goal.count {
        if index1 < cards1.count {
            if cards1[index1] == goal[goalIndex] {
                index1 += 1
                continue
            }
        }
        
        if index2 < cards2.count {
            if cards2[index2] == goal[goalIndex] {
                index2 += 1
                continue
            }
        }
        
        return "No"
    }
    
    return "Yes"
}