import Foundation

func solution(_ numLog:[Int]) -> String {
    var command: [Character] = []
    
    for i in 1..<numLog.count {
        switch numLog[i] - numLog[i-1] {
            case 1: command.append("w")
            case -1: command.append("s")
            case 10: command.append("d")
            case -10: command.append("a")
            default: break
        }
    }
    
    return String(command)
}