import Foundation

func solution(_ n: Int, _ q: [[Int]], _ ans: [Int]) -> Int {
    var result = 0
    
    // 조합 생성기
    func combinations(_ arr: [Int], _ k: Int) -> [[Int]] {
        if k == 0 { return [[]] }
        if arr.count < k { return [] }
        if arr.count == k { return [arr] }
        
        var res = [[Int]]()
        for i in 0..<(arr.count) {
            let elem = arr[i]
            let rest = Array(arr[(i+1)...])
            for comb in combinations(rest, k-1) {
                res.append([elem] + comb)
            }
        }
        return res
    }
    
    // 전체 조합 생성 (1~n 중 5개)
    let allComb = combinations(Array(1...n), 5)
    
    // 각 조합을 검증
    for comb in allComb {
        var valid = true
        for (i, query) in q.enumerated() {
            let count = query.filter { comb.contains($0) }.count
            if count != ans[i] {
                valid = false
                break
            }
        }
        if valid {
            result += 1
        }
    }
    
    return result
}
