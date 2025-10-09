import Foundation

func solution(_ A:String, _ B:String) -> Int {
    
    var arr = Array(A)
    var countLeft = 1
    
    if A == B { return 0 }
    
    for startIndex in stride(from: arr.count-1, to: 0, by: -1) {
        var temp: [Character] = []
        for add in 0..<arr.count {
            temp.append(arr[(startIndex + add) % arr.count])
        }
        if String(temp) == B { 
            return countLeft
        }
        countLeft += 1
    }
    
    return -1
}