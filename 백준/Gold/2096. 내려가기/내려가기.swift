import Foundation

let N = Int(readLine()!)!
var map: [[Int]] = []
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(input)
}

solution(N, map)

func solution(_ N: Int, _ map: [[Int]]) {
    var sumLineMax = map[0]
    var sumLineMin = map[0]
    
    for index in 1..<N {
        let addLine = map[index]
        var subSumLineMax = [0, 0, 0]
        var subSumLineMin = [0, 0, 0]
        subSumLineMax[0] = max(sumLineMax[0] + addLine[0], sumLineMax[1] + addLine[0])
        subSumLineMax[1] = max(sumLineMax[0] + addLine[1], sumLineMax[1] + addLine[1], sumLineMax[2] + addLine[1])
        subSumLineMax[2] = max(sumLineMax[1] + addLine[2], sumLineMax[2] + addLine[2])
        
        subSumLineMin[0] = min(sumLineMin[0] + addLine[0], sumLineMin[1] + addLine[0])
        subSumLineMin[1] = min(sumLineMin[0] + addLine[1], sumLineMin[1] + addLine[1], sumLineMin[2] + addLine[1])
        subSumLineMin[2] = min(sumLineMin[1] + addLine[2], sumLineMin[2] + addLine[2])
        
        sumLineMax = subSumLineMax
        sumLineMin = subSumLineMin
    }
    
    print(sumLineMax.max()!, sumLineMin.min()!)
}