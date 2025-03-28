import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var set: Set<Int> = Set(win_nums)
    var correct = 0
    var unreadable = 0
    
    for n in lottos {
        if n == 0 { unreadable += 1 }
        if set.contains(n) { correct += 1 }
    }
    
    return [getRank(of: correct+unreadable), getRank(of: correct)]
}

func getRank(of correct: Int) -> Int {
    switch correct {
        case 6: return 1
        case 5: return 2
        case 4: return 3
        case 3: return 4
        case 2: return 5
        default: return 6
    }
}