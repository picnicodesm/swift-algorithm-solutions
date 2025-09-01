import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    
    var result: [Double] = []
    let points = collatz(k)

    func volume(in range: [Int]) -> Double {
        var vol: Double = 0.0
        let lower = range[0]
        let upper = points.count + range[1] - 1
        
        if lower > upper { return -1.0 }
        
        for i in lower..<upper {
            vol += Double((points[i] + points[i + 1])) * 0.5
        }
        
        return vol
    }
    
    for range in ranges {
        let v = volume(in: range)
        result.append(v)
    }
    
    return result
}

func collatz(_ k: Int) -> [Int] {
    var k = k
    var arr: [Int] = [k]
    
    while k > 1 {
        if k % 2 == 0 {
            k /= 2
        } else {
            k = 3 * k + 1
        }
        
        arr.append(k)
    }
    
    return arr
}

