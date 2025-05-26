import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result = 0
    var visited = Array(repeating: false, count: dungeons.count)

    func dfs(_ tired: Int, _ count: Int) {
        result = max(result, count)

        for i in 0..<dungeons.count {
            if !visited[i] && tired >= dungeons[i][0] {
                visited[i] = true
                dfs(tired - dungeons[i][1], count + 1)
                visited[i] = false
            }
        }
    }

    dfs(k, 0)
    return result
}

