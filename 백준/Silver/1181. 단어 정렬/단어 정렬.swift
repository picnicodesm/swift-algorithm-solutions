let N = Int(readLine()!)!
var words = Set<String>()

for _ in 0..<N {
    let word = readLine()!
    words.insert(word)
}

let sorted = words.sorted { $0.count == $1.count ? $0 < $1 : $0.count < $1.count }

for word in sorted {
    print(word)
}