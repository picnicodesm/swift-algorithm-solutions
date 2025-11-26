let point1 = readLine()!.split(separator: " ").map { Int(String($0))! }
let point2 = readLine()!.split(separator: " ").map { Int(String($0))! }
let point3 = readLine()!.split(separator: " ").map { Int(String($0))! }

let minX = min(point1[0], point2[0], point3[0])
let maxX = max(point1[0], point2[0], point3[0])
let minY = min(point1[1], point2[1], point3[1])
let maxY = max(point1[1], point2[1], point3[1])

var points: Set<[Int]> = [
    [minX, minY],
    [minX, maxY],
    [maxX, minY],
    [maxX, maxY]
]

points.remove(point1)
points.remove(point2)
points.remove(point3)

print(points.first![0], points.first![1])