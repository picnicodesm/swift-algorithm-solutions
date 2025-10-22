import Foundation

func solution(_ common:[Int]) -> Int {
    var diff = common[1] - common[0]
    var diff2 = common[2] - common[1]
    
    if diff == diff2 {
        return common.last! + diff
    } else {
        return common.last! * (common[1] / common[0])
    }
}