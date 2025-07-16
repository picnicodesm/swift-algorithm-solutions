import Foundation

func solution(_ n:Int) -> [Int] {
    // n * n 크기의 2차원 배열을 0으로 초기화
    var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    // 현재 위치 (x: 행, y: 열)
    // 시작점을 (-1, 0)으로 설정하여 첫 '아래' 이동 시 (0, 0)으로 시작하게 함
    var x = -1 
    var y = 0
    
    // 채울 숫자
    var num = 1
    
    // 방향: 0 = 아래, 1 = 오른쪽, 2 = 위-왼쪽
    let dx = [1, 0, -1] // 행 변화량
    let dy = [0, 1, -1] // 열 변화량
    var direction = 0
    
    // 총 채워야 할 칸의 수
    let totalCells = n * (n + 1) / 2
    
    // 모든 칸을 채울 때까지 반복
    while num <= totalCells {
        // 다음 이동할 위치 계산
        let nx = x + dx[direction]
        let ny = y + dy[direction]
        
        // 이동 가능한지 체크:
        // 1. 배열 범위 내에 있는지 (0 <= nx < n, 0 <= ny <= nx - 삼각형 형태 유지)
        // 2. 해당 칸이 아직 채워지지 않았는지 (matrix[nx][ny] == 0)
        if nx >= 0 && nx < n && ny >= 0 && ny <= nx && matrix[nx][ny] == 0 {
            x = nx
            y = ny
            matrix[x][y] = num
            num += 1
        } else {
            // 이동 불가능하면 방향 전환
            direction = (direction + 1) % 3
        }
    }
    
    // 2차원 배열의 유효한 값들을 1차원 배열로 변환
    var result: [Int] = []
    for i in 0..<n {
        for j in 0...i { // 삼각형 형태이므로 j는 i까지만 순회
            result.append(matrix[i][j])
        }
    }
    
    return result
}