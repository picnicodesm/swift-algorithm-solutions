func paint(_ paper: inout [Bool], startPosition: [Int]) {
    let startIndex = startPosition[1] * 100 + startPosition[0]
    for colIndex in 0..<10 {
        for rowIndex in 0..<10 {
            paper[startIndex + colIndex * 100 + rowIndex] = true
        }
    }
}

var paper: [Bool] = [Bool](repeating: false, count: 10000)
let trial = Int(readLine()!)!

for _ in 0..<trial {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    paint(&paper, startPosition: input)
}

print(paper.filter { $0 }.count )