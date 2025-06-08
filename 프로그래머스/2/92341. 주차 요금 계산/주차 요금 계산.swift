import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var dic: [String: String] = [:] 
    var mins: [String: Int] = [:]
    var orders: [String: Int] = [:]
    var order = 0
    var results: [Int] = []

    for record in records {
        let record = record.split(separator: " ").map { String($0) }
        if record[2] == "IN" { 
            dic[record[1]] = record[0]
            continue
        } else {
            order += 1
            let min = getMin(from: dic[record[1]]!, to: record[0])
            dic[record[1]] = nil
            if mins[record[1]] == nil { 
                mins[record[1]] = min
                orders[record[1]] = order
            } else { 
                mins[record[1]]! += min
                orders[record[1]]! += order
            }
            
        }
    }
    
    for key in dic.keys {
        order += 1
        let min = getMin(from: dic[key]!)
        if mins[key] == nil { 
            mins[key] = min
            orders[key] = order
        } else { 
            mins[key]! += min
            orders[key]! += order
        }
    }
    
    for (k, v) in orders.sorted(by: { Int($0.key)! < Int($1.key)! }) {
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