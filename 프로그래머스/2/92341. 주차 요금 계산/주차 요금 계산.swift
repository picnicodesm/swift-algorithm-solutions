import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var dic: [String: String] = [:] 
    var mins: [String: Int] = [:]
    var results: [Int] = []

    for record in records {
        let record = record.split(separator: " ").map { String($0) }
        if record[2] == "IN" { 
            dic[record[1]] = record[0]
            continue
        }
        
        let min = getMin(from: dic[record[1]]!, to: record[0])
        dic[record[1]] = nil
        mins[record[1], default: 0] += min
    }
    
    for key in dic.keys {
        let min = getMin(from: dic[key]!)
        mins[key, default: 0] += min
    }
    
    for k in mins.keys.sorted() {
        results.append(getFee(from: mins[k]!, fees))
    }
    
    return results
}

func getMin(from inTime: String, to outTime: String = "23:59") -> Int { 
    let inTime = inTime.split(separator: ":").map { Int(String($0))! }
    let outTime = outTime.split(separator: ":").map { Int(String($0))! }
    let inMinute = inTime[0] * 60 + inTime[1]
    let outMinute = outTime[0] * 60 + outTime[1]
    
    return outMinute - inMinute
}

func getFee(from minute: Int, _ fees: [Int]) -> Int {
    var minute = minute
    let baseTime = fees[0]
    let baseFee = fees[1]
    let unitMinute = fees[2]
    let unitFee = fees[3]
    var fee = 0
    
    if minute <= baseTime { return baseFee }
    else {
        fee += baseFee
        minute -= baseTime
    }
    
    if minute % unitMinute == 0 {
        return fee + (minute / unitMinute * unitFee)
    } else {
        return fee + ((minute / unitMinute + 1) * unitFee)
    }
}