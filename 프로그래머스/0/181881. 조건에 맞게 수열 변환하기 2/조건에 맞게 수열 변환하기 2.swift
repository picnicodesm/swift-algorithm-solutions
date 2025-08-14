import Foundation

func solution(_ arr:[Int]) -> Int {
    var arr = arr
    var before = arr
    var count = 0
    
    while true {
        count += 1
        for i in 0..<arr.count {
            if arr[i] >= 50 && arr[i] % 2 == 0 { arr[i] /= 2 }
            else if arr[i] < 50 && arr[i] % 2 != 0 { arr[i] = arr[i] * 2 + 1 }
        }
        
        if arr == before { return count - 1 }
        else { 
            before = arr
        }
    }
    
    return -1
}