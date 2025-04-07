import Foundation

let roomNumberString = readLine()!

solution(roomNumberString)

func solution(_ roomNumberString: String) {
    var numbers: [String: Int] = [:]
    var result = 0
    buyNumberSet()
    
    for nString in roomNumberString {
        switch nString {
        case "6":
            if numbers[String(nString)]! <= 0 {
                if numbers["9"]! > 0 { numbers["9"]! -= 1 }
                else {
                    buyNumberSet()
                    numbers[String(nString)]! -= 1
                }
            } else { numbers[String(nString)]! -= 1 }
        case "9":
            if numbers[String(nString)]! <= 0 {
                if numbers["6"]! > 0 { numbers["6"]! -= 1 }
                else {
                    buyNumberSet()
                    numbers[String(nString)]! -= 1
                }
            } else { numbers[String(nString)]! -= 1 }
        default:
            if numbers[String(nString)]! <= 0 {
                buyNumberSet()
                numbers[String(nString)]! -= 1
            } else { numbers[String(nString)]! -= 1 }
        }
    }
    
    func buyNumberSet() {
        _ = Array(0...9).map {
            if numbers["\($0)"] == nil {
                numbers["\($0)"] = 1
            } else {
                numbers["\($0)"]! += 1
            }
        }
        result += 1
    }
    
    print(result)
}
