import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] { 
    
    var userReports: [String: Set<String>] = [:]
    var reportedCount: [String: Int] = [:]
    var result: [Int] = Array(repeating: 0, count: id_list.count)
    
    for user in id_list {
        userReports[user] = Set<String>()
        reportedCount[user] = 0
    }
    
    for str in report {
        let content = str.split(separator: " ").map { String($0) }
        let reportUser = content[0]
        let reportedUser = content[1]
        
        if var userReport = userReports[reportUser] {
            if !userReport.contains(reportedUser) {
                userReports[reportUser]!.insert(reportedUser)
                reportedCount[reportedUser]! += 1
            }
        }
    }
    
    for i in 0..<id_list.count {
        let user = id_list[i]
        result[i] = userReports[user]!.filter { reportedCount[$0]! >= k }.count
    }
    
    return result
}