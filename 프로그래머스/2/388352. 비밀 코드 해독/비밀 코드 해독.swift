import Foundation

// q에 있는 숫자들을 가지고 조합을 만든 뒤 테스트를 하는게 좋을수도?

func solution(_ n:Int, _ q:[[Int]], _ ans:[Int]) -> Int {
    let combinations = getCombinations(n: n)
    var result = 0
    
    print(combinations.count)
    
    for combination in combinations {
        var possible = true
 
        for index in 0..<q.count {
            let query = q[index] 
            var same = Set(query).intersection(Set(combination)).count
            
            if same != ans[index] {
                possible = false
                break
            }
        }
    
        if possible { 
            result += 1
        }
    }
    
    return result
}

func getCombinations(n: Int, k: Int = 5) -> [[Int]] {
    var result: [[Int]] = []
    var current = [1, 2, 3, 4, 5]
    var stack: [[Int]] = [current]
    var visited: Set<[Int]> = []
    
    while !stack.isEmpty {
        let current = stack.removeLast()
        result.append(current)
        visited.insert(current)
        var temp = current
        
        if current[0] == n-4 {
            continue
        }
        
        for place in 0..<5 {
            if place == 4 {
                var num = current[place]
                while num < n {
                    num += 1
                    temp[place] = num
                    if !visited.contains(temp) {
                        stack.append(temp)    
                    }
                }
            } else {
                var num = current[place]
                while num < current[place+1] - 1 {
                    num += 1
                    temp[place] = num
                    if !visited.contains(temp) {
                        stack.append(temp)    
                    }
                }
            }
        }   
    }

    return result
}