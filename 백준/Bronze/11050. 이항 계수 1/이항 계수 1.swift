import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
solution(nk[0], nk[1])


func solution(_ N: Int, _ K: Int) {
    var table = Array(repeating: Array(repeating: 0, count: K+1), count: N+1)
    
    for n in 0..<table.count {
        for k in 0...min(n, K) {
            if k == 0 || n == k { table[n][k] = 1 }
            else { table[n][k] = table[n-1][k-1] + table[n-1][k] }
        }
    }
    
    print(table[N][K])
}