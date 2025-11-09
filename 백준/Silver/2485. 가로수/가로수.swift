func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd(b, a%b)
    }
}

func gcdInArr(_ arr: [Int]) -> Int {
    return arr.reduce(arr[0]) { gcd($0, $1) }
}

let N = Int(readLine()!)!
var input: [Int] = []
var spacing: [Int] = []
var output = 0

for _ in 0..<N {
    input.append(Int(readLine()!)!)
}

input = input.reversed()

for index in 1..<N {
    spacing.append(input[index] - input[index-1])
}

spacing = spacing.sorted(by: >)

let gcdN = gcdInArr(spacing)

for index in 0..<spacing.count {
    output += spacing[index] / gcdN - 1
}

print(output)
