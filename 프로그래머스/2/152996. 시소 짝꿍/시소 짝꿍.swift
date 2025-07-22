import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var result = 0
    var dic: [Double: Int] = [:]
    
    for weight in weights {
        dic[Double(weight), default: 0] += 1
    }
    
    for (k, _) in dic {
        if dic[k]! > 1 {
            result += dic[k]! * (dic[k]! - 1) / 2 // nC2
        }

        if dic[k * 2/3] != nil {
            result += dic[k]! * dic[k * 2/3]!
        }

        if dic[k * 2/4] != nil {
            result += dic[k]! * dic[k * 2/4]!
        }

        if dic[k * 3/4] != nil {
            result += dic[k]! * dic[k * 3/4]!
        }
    }
    
    return Int64(result)
}
