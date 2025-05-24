import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dic: [String: Int] = [:]
    var result = 1

    for item in clothes {
        let type = item[1]
        dic[type, default: 0] += 1
    }

    for v in dic.values {
        result *= (v+1)
    }

    return result - 1
}