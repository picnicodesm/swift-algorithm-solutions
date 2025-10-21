import Foundation

var maxHistory: [[Int]] = []
var maxScore: Int = -1

func dfs(_ history: [Int], _ info: [Int], depth: Int, arrow: Int) {
    var copyHistory = history
    var copyArrow = arrow
    
    if depth == 0 || arrow <= 0 {
        copyHistory[0] = depth == 0 ? arrow : copyHistory[0]
        let score = getScoreGap(history, info)
        if maxScore == score {
            maxHistory.append(copyHistory)
        } else if maxScore < score {
            maxScore = score
            maxHistory = [copyHistory]
        }
        
        return
    }
    
    let shooting = info[depth] + 1
    if arrow >= shooting {
        copyArrow -= shooting
        copyHistory[depth] = shooting
        
        dfs(copyHistory, info, depth: depth - 1, arrow: copyArrow)
        
        copyHistory[depth] = 0
    }
    
    dfs(copyHistory, info, depth: depth - 1, arrow: arrow)
}

func getScoreGap(_ history: [Int], _ info: [Int]) -> Int {
    var lion = 0, apeach = 0
    for (i, score) in history.enumerated() {
        if score == 0 {
            apeach += (info[i] > 0 ? i : 0)
        } else {
            lion += i
        }
    }
    
    return lion - apeach
}

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var lionHistory: [Int] = Array(repeating: 0, count: 11)
    dfs(lionHistory, info.reversed(), depth: 10, arrow: n)
    
    guard maxScore > 0 else {
        return [-1]
    }
    
    maxHistory.sort {
        $0.filter { $0 != 0 }.count > $1.filter { $0 != 0}.count
    }
    
    return maxHistory.first!.reversed()
}

