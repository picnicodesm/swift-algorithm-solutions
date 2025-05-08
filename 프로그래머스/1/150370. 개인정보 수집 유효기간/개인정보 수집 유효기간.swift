import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {

    var days: [String] = [] 
    var privacyTerms: [String] = []
    var termDic: [String: Int] = [:]
    var result: [Int] = []
    let todayDateComponent: [Int] = today.split(separator: ".").map { Int(String($0))! }
    
    for term in terms {
        let keyValue = term.split(separator: " ").map { String($0) }
        termDic[keyValue[0]] = Int(keyValue[1])!
    }
    
    for privacy in privacies {
        days.append(String(privacy.split(separator: " ")[0]))
        privacyTerms.append(String(privacy.split(separator: " ")[1]))
    }
    
    for index in 0..<privacies.count {
        let day = days[index]
        let privacyTerm = privacyTerms[index]
        let dateComponent = day.split(separator: ".").map { Int(String($0))! }
        let addMonth = dateComponent[2] == 1 ? termDic[privacyTerm]! - 1 : termDic[privacyTerm]!
        let afterDay = dateComponent[2] == 1 ? 28 : dateComponent[2]-1
        let afterMonth = dateComponent[1] + (addMonth % 12) > 12 ? dateComponent[1] + (addMonth % 12) - 12 : dateComponent[1] + (addMonth % 12)
        let afterYear = dateComponent[1] + (addMonth % 12) > 12 ? dateComponent[0] + (addMonth / 12) + 1 : dateComponent[0] + (addMonth / 12)
    
        if afterYear < todayDateComponent[0] { result.append(index+1) }
        else if afterYear == todayDateComponent[0] {
            if afterMonth < todayDateComponent[1] { result.append(index+1) }
            else if afterMonth == todayDateComponent[1] {
                if afterDay < todayDateComponent[2] { result.append(index+1) }
            }
        }
    }
    
    return result
}