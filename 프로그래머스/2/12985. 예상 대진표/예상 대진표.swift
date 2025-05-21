import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var answer = 1
    var aN = a
    var bN = b
    
    while !(abs(aN-bN) == 1 && max(aN, bN)%2 == 0 && min(aN, bN)%2 == 1) {
        aN = aN%2 == 0 ? aN/2 : aN/2+1
        bN = bN%2 == 0 ? bN/2 : bN/2+1
        answer += 1
    }

    return answer
}