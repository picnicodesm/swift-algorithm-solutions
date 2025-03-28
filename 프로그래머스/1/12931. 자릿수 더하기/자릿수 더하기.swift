import Foundation

func solution(_ n:Int) -> Int
{
    var answer:Int = 0

    answer = String(n).map { Int(String($0))! }.reduce(0, +)
    
    return answer
}