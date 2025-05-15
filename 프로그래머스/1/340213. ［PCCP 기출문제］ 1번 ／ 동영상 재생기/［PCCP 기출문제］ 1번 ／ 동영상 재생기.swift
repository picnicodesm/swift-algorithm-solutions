import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    
    enum TimeOrder { case before, after, same }
    
    func checkIsOpening(_ time: String, start: String, end: String) -> Bool {
        let orderWithStart = getOrder(time, from: start)
        let orderWithEnd = getOrder(time, from: end)
        
        if orderWithStart == .before || orderWithEnd == .after { return false }
        else { return true}
    }
    
    func addTenSec(from time: String) -> String {
        let timeComponent = time.split(separator: ":").map { Int(String($0))! }
        var min = (timeComponent[1] + 10) % 60
        var hour = (timeComponent[1] + 10) < 60 ? timeComponent[0] : (timeComponent[0] + 1)
        
        let minStr = min >= 0 && min < 10 ? "0\(min)" : "\(min)"
        let hourStr = hour >= 0 && hour < 10 ? "0\(hour)" : "\(hour)"

        return hourStr + ":" + minStr
    }
    
    func minusTenSec(from time: String) -> String {
        let timeComponent = time.split(separator: ":").map { Int(String($0))! }
        let min = (timeComponent[1] - 10) < 0 ? (timeComponent[1] + 50) : (timeComponent[1] - 10)
        let hour = (timeComponent[1] - 10) < 0 ? (timeComponent[0] - 1) : timeComponent[0]
        
        let minStr = min >= 0 && min < 10 ? "0\(min)" : "\(min)"
        let hourStr = hour >= 0 && hour < 10 ? "0\(hour)" : "\(hour)"

        return hourStr + ":" + minStr
    }
    
    func getOrder(_ time: String, from time2: String) -> TimeOrder {
        let timeComponent = time.split(separator: ":").map { Int(String($0))! }
        let time2Component = time2.split(separator: ":").map { Int(String($0))! }

        if timeComponent == time2Component { return .same }
        if timeComponent[0] < time2Component[0] { return .before }
        else if timeComponent[0] > time2Component[0] { return .after }
        else { 
            return timeComponent[1] < time2Component[1] ? .before : .after
        }
    }
    
    var result = pos
    
    for command in commands {
        if checkIsOpening(result, start: op_start, end: op_end) {
            result = op_end
        }

        if command == "next" {
            result = addTenSec(from: result)
            if getOrder(result, from: video_len) == .after { result = video_len }
        } else {
            result = minusTenSec(from: result)
            if getOrder(result, from: "00:00") == .before { result = "00:00" }
        }
    }
    
    if checkIsOpening(result, start: op_start, end: op_end) {
        result = op_end
    }
    
    return result
}