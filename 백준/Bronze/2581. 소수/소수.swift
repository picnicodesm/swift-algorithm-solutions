import Foundation

let m = Int(readLine()!)!
let n = Int(readLine()!)!

var net = Array(0...n)
net[0] = 0
net[1] = 0

if n < 4 {
    net = [0, 0, 2, 3]
} else {
    for i in 2...Int(sqrt(Double(n))) {
        guard net[i] != 0 else { continue }
        for n in stride(from: i*i, through: n, by: i) {
            net[n] = 0
        }
    }
}

let filtered = net[m...n].filter { $0 != 0 }
if filtered.isEmpty {
    print(-1)
} else {
    print(filtered.reduce(0, +))
    print(filtered[0])
}
