import Foundation

func solution(_ n:Int, _ w:Int, _ num:Int) -> Int {    
    var boxes: [[Int]] = []
    var isReversedRow: [Bool] = []
    var isReverse: Bool = false
    var currentBoxNum = 1
    var result = 0
    var row = num % w == 0 ? num / w - 1 : num / w
    var col = -1
    
    while currentBoxNum <= n {
        let lastBoxNum = currentBoxNum + w > n ? n : currentBoxNum + w - 1
        let boxRow = Array(currentBoxNum...lastBoxNum) + Array(repeating: 0, count: w-(lastBoxNum-currentBoxNum+1))
        
        isReversedRow.append(isReverse)
        boxes.append(isReverse ? boxRow.reversed() : boxRow)
        currentBoxNum = lastBoxNum + 1
        isReverse.toggle()
    }

    
    if isReversedRow[row] {
        col = num % w == 0 ? 0 : w - (num % w)
    } else { 
        col = num % w == 0 ? w - 1 : num % w - 1
    }
    
    while row < boxes.count && boxes[row][col] != 0 {
        result += 1   
        row += 1
    }
    
    return result
}