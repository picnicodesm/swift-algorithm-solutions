import Foundation

func solution(_ str1: String, _ str2: String) -> Int {
    func makeMultiset(_ s: String) -> [String: Int] {
        var dict = [String: Int]()
        let chars = Array(s.lowercased())
        for i in 0..<chars.count - 1 {
            let pair = String([chars[i], chars[i+1]])
            if pair.allSatisfy({ $0.isLetter }) {
                dict[pair, default: 0] += 1
            }
        }
        return dict
    }

    let dict1 = makeMultiset(str1)
    let dict2 = makeMultiset(str2)

    let allKeys = Set(dict1.keys).union(dict2.keys)

    var intersectionCount = 0
    var unionCount = 0

    for key in allKeys {
        let count1 = dict1[key] ?? 0
        let count2 = dict2[key] ?? 0
        intersectionCount += min(count1, count2)
        unionCount += max(count1, count2)
    }

    if unionCount == 0 {
        return 65536
    }

    let similarity = Double(intersectionCount) / Double(unionCount)
    return Int(similarity * 65536)
}