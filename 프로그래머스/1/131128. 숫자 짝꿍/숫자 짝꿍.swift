import Foundation

func solution(_ X:String, _ Y:String) -> String {
    
    var nums1 = Array(repeating: 0, count: 10)
    var nums2 = Array(repeating: 0, count: 10)
    var minNums = Array(repeating: 0, count: 10)
    var result = ""
    var isZero = false
    
    for c in X {
        nums1[Int(String(c))!] += 1
    }
    
    for c in Y {
        nums2[Int(String(c))!] += 1
    }
    
    let _ = Array(0...9).map {
        minNums[$0] = min(nums1[$0], nums2[$0])
    }
    
    let filtered = minNums.filter { $0 != 0 }
    if filtered.isEmpty {
        return "-1"
    }
     
    if minNums[0] != 0 { isZero = true }
    for index in 1...9 {
        if minNums[index] != 0 { isZero = false }
    }
    
    if isZero { return "0" }
    
    for n in stride(from: 9, through: 0, by: -1) {
        result += String(repeating: String(n), count: minNums[n])
    }
    
    return result
}