import Foundation

func solution(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    var result = 0
    
    for person in 0..<schedules.count {
        var success = true
        let schedule = schedules[person]
        let limitMinute = schedule % 100 + 10 > 59 ? schedule % 100 - 50 : schedule % 100 + 10
        var limitHour = schedule % 100 + 10 > 59 ? schedule / 100 + 1 : schedule / 100
    
        for index in 0..<7 {
            var nowDay = startday + index
            if nowDay > 7 { nowDay -= 7 }
            if nowDay == 6 || nowDay == 7 { continue } 
            
            let hourLog = timelogs[person][index] / 100
            let minuteLog = timelogs[person][index] % 100

            if limitHour == hourLog {
                if limitMinute < minuteLog {
                    success = false
                    break
                }
            } else if limitHour < hourLog {
                success = false
                break
            }
        }
        
        if success { result += 1 }
    }
    
    return result
}