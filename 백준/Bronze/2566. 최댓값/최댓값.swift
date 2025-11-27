var arr: [Int] = []
for _ in 0..<9 {
    let _ = readLine()!.split(separator: " ").map {
        arr.append(Int(String($0))!)
    }
}

let max = arr.max()!
let firstIndex = arr.distance(from: arr.startIndex, to: arr.firstIndex(of: max)!)
print(max)
print("\(firstIndex / 9 + 1) \(firstIndex % 9 + 1)")