import Foundation

func solution(_ my_string:String, _ queries:[[Int]]) -> String {
    var charArr = Array(my_string)
    
    for query in queries {
        let reversed = Array(charArr[query[0]...query[1]].reversed())

        for i in 0..<reversed.count {
            charArr[query[0] + i] = reversed[i]
        }
    }
    
    return String(charArr)
}