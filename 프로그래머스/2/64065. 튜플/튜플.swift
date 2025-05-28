import Foundation

func solution(_ s:String) -> [Int] {
    let startIndex = s.index(s.startIndex, offsetBy: 2)
    let endIndex = s.index(s.endIndex, offsetBy: -3)
    var s: [String] = s[startIndex...endIndex].replacingOccurrences(of: "},{", with: "/").split(separator: "/").map { String($0) }
    var arr: [Set<Int>] = []
    var reversedResult: [Int] = []
    
    for str in s {
        let set = Set(str.split(separator: ",").map { Int(String($0))! })
        arr.append(set)
    }
    
    arr = arr.sorted(by: { $0.count > $1.count })
    
    for index in 1..<arr.count {
        let lastNum = arr[index-1].subtracting(arr[index]).first!
        reversedResult.append(lastNum)
    }
    
    reversedResult.append(arr.last!.first!)
    
    return reversedResult.reversed()
}