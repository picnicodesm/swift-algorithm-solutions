import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dic: [Int: Int] = [:]
    var arr: [Int] = []
    var select = k
    var index = 0
    
    for i in tangerine {
        dic[i, default: 0] += 1
    }
    
    arr = dic.sorted (by: { $0.value > $1.value }).map { $0.value }
    
    while select > 0 {
        if select <= arr[index] { break }
        else { 
            select -= arr[index]
            index += 1
        }
    }
    
    return index+1
}