import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var maxNum = 0
    var minNum = 0

    for i in sizes {
        maxNum = max(maxNum, i.max()!)
        minNum = max(minNum, i.min()!)
    }

    return maxNum * minNum
}