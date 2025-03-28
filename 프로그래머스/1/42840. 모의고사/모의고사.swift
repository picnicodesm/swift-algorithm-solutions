import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let cycle1 = [1, 2, 3, 4, 5]
    let cycle2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let cycle3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    var scores = [0, 0, 0]
    var result: [Int] = []
    
    for index in 0..<answers.count {
        if cycle1[index % cycle1.count] == answers[index] { scores[0] += 1}
        if cycle2[index % cycle2.count] == answers[index] { scores[1] += 1}
        if cycle3[index % cycle3.count] == answers[index] { scores[2] += 1}
    }
    
    for (index, score) in scores.enumerated() {
        if score == scores.max()! {
            result.append(index+1)
        }
    }
    
    return result
}