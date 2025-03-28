import Foundation

func solution(_ n:Int) -> Int {
    return net(n)
}

func net(_ n: Int) -> Int {
    if n == 1 { return -1 }
    if n < 4 { return n-1 }
    
    var net = Array(repeating: true, count: n+1)
    net[0] = false
    net[1] = false
    
    for i in 2...Int(sqrt(Double(n))) {
        for remover in stride(from: i*i, through: n, by: i) {
            net[remover] = false
        }
    }

    return net.filter { $0 }.count
}