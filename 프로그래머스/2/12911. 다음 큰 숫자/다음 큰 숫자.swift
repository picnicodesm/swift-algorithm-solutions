import Foundation

func solution(_ n:Int) -> Int {    
    var answer:Int = n+1
    
    while String(answer, radix: 2).filter {$0=="1"}.count != String(n, radix: 2).filter {$0=="1"}.count {
        answer += 1
    }
    
    return answer
}