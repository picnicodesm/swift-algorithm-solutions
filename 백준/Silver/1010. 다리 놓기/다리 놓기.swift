let N = Int(readLine()!)!

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    print(solution(input[0], input[1]))
}

func solution(_ n: Int, _ m: Int) -> Int {
    var store = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
    
    for i in 0...m {
        for k in 0...min(i, n) {
            if k == 0 || i == k {
                store[i][k] = 1
            } else {
                store[i][k] = store[i-1][k-1] + store[i-1][k]
            }
        }
    }
    
    return store[m][n]
}