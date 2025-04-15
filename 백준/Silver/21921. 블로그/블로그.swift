import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let visitorNums = readLine()!.split(separator: " ").map { Int(String($0))! }

solution(input[0], input[1], visitorNums)

func solution(_ days: Int, _ daysForFind: Int, _ visitorNums: [Int]) {
    
    var currentMax = visitorNums[0..<daysForFind].reduce(0,+)
    var maxVisitorNum = currentMax
    var maxVisitedDaysCount = 1
    
    for index in daysForFind..<visitorNums.count {
        currentMax += visitorNums[index]
        currentMax -= visitorNums[index-daysForFind]
        
        if maxVisitorNum < currentMax {
            maxVisitorNum = currentMax
            maxVisitedDaysCount = 1
        } else if maxVisitorNum == currentMax {
            maxVisitedDaysCount += 1
        }
    }
    
    if maxVisitorNum == 0 {
        print("SAD")
    } else {
        print(maxVisitorNum)
        print(maxVisitedDaysCount)
    }
}