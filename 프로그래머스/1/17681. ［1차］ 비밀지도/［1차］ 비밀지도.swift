import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var map1: [String] = []
    var map2: [String] = []
    
    
    let _: [Int]  = zip(arr1, arr2).map { 
        var line1 = String($0, radix: 2) 
        var line2 = String($1, radix: 2)
        
        map1.append(String(repeating: "0", count: n-line1.count) + line1)
        map2.append(String(repeating: "0", count: n-line2.count) + line2)
        
        return $0
    }

    
    answer = zip(map1, map2).map { 
        return String(zip($0, $1).map {
            return $0 == "0" && $1 == "0" ? "0" : "1"
        })
    }.map { 
        var line = $0
        line = line.replacingOccurrences(of: "0", with: " ")
        line = line.replacingOccurrences(of: "1", with: "#")
        return line
    }
    
    
    return answer
}