var angles: [Int] = []

for _ in 0..<3 {
    let input = Int(readLine()!)!
    angles.append(input)
}

if angles.reduce(0, +) == 180 {
    let set = Set(angles)
    if set.count == 1 {
        print("Equilateral")
    } else if set.count == 2 {
        print("Isosceles")
    } else {
        print("Scalene")
    }
} else {
    print("Error")
}
