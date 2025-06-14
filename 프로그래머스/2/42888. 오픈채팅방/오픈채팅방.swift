import Foundation

func solution(_ records:[String]) -> [String] {    
    var inOutRecords: [(uid: String, inOut: String)] = [] 
    var nicknames: [String: String] = [:]
    var result: [String] = []
    
    for record in records {
        let content = record.split(separator: " ").map { String($0) }
        let (inOut, uid) = (content[0], content[1])
        switch inOut {
            case "Enter":
            inOutRecords.append((uid, inOut))
            nicknames[uid] = content[2]
            case "Leave": inOutRecords.append((uid, inOut))
            case "Change": nicknames[uid] = content[2]
            default: break
        }
    }
    
    for inOutRecord in inOutRecords {
        if inOutRecord.inOut == "Enter" { result.append("\(nicknames[inOutRecord.uid]!)님이 들어왔습니다.") }
        else { result.append("\(nicknames[inOutRecord.uid]!)님이 나갔습니다.") }
    }
    
    return result
}