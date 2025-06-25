import Foundation

func solution(_ numbers:String) -> Int {
    var result = 0
    var numbers: [Character] = Array(numbers)
    var visited: Set<Int> = []
    
    func dfs(_ numString: String, _ adder: Character, _ remains: [Character]) {        
        var remains = remains
        let currentNum = numString + String(adder)
        let num = Int(currentNum)!
        
        if visited.contains(num) { return }
        else { visited.insert(num) }
        
        if isPrime(num) { result += 1 }
        if remains.isEmpty { return }
        
        for c in remains {
            var copy = remains
            let index = remains.firstIndex(of: c)!
            copy.remove(at: index)
            dfs(currentNum, c, copy)
        }
    }
             
    dfs("0", "0", numbers)
       
    return result
}
    
func isPrime(_ n: Int) -> Bool {
    if n <= 1 { return false }
    if n < 4 { return true }
    
    for i in 2..<Int(sqrt(Double(n)))+1 {
        if n % i == 0 { return false }
    }
    
    return true
}