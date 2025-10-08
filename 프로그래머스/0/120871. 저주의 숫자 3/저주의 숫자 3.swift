import Foundation

func solution(_ n:Int) -> Int {
    var arr: [Int] = []
    var num = 1

    for _ in 1...n {
        while num % 3 == 0 || String(num).contains("3") {
            num += 1
        }
        arr.append(num)
        num += 1
    }
    
    return arr[n-1]
}