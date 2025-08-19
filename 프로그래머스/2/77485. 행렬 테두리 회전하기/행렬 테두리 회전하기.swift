import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var result: [Int] = [] 
    var map: [[Int]] = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    
    for i in 0..<rows {
        for j in 0..<columns {
            map[i][j] = i * columns + (j+1)
        }
    }

    for query in queries {
        result.append(rotate(query: query, map: &map))
        // printMap(map)
    }
    
    return result
}

func rotate(query: [Int], map: inout [[Int]]) -> Int {
    var temp: Int = -1
    var next: Int = -1
    let (x1, y1, x2, y2) = (query[0]-1, query[1]-1, query[2]-1, query[3]-1) // x1행, y1열, x2행, y2열 순
    var maxMin = map[x1][y1]
    
    // x1행: 오른쪽으로
    temp = map[x1][y2]
    maxMin = min(maxMin, temp)
    for col in stride(from: y2, to: y1, by: -1) {
        let move = map[x1][col-1]
        maxMin = min(maxMin, move)
        map[x1][col] = move
    }
    next = temp
    
    // y2열: 아래로 1칸
    temp = map[x2][y2]
    maxMin = min(maxMin, temp)
    for row in stride(from: x2, to: x1, by: -1) {
        let move = map[row-1][y2]
        maxMin = min(maxMin, move)
        map[row][y2] = move
    }
    map[x1+1][y2] = next
    next = temp
    
    // x2행: 왼쪽으로 1칸
    temp = map[x2][y1]
    maxMin = min(maxMin, temp)
    for col in stride(from: y1, to: y2, by: 1) {
        let move = map[x2][col+1]
        maxMin = min(maxMin, move)
        map[x2][col] = move
    }
    map[x2][y2-1] = next
    next = temp
    
    // y1열: 위로 1칸
    for row in stride(from: x1, to: x2, by: 1) {
        let move = map[row+1][y1]
        maxMin = min(maxMin, move)
        map[row][y1] = move
    }
    map[x2-1][y1] = next
    
    return maxMin
}

func printMap(_ map: [[Int]]) {
    for i in 0..<map.count {
        for j in 0..<map[0].count {
            print(map[i][j], terminator: " ")
        }
        print("")
    }
    print("")
}






