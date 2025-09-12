import Foundation

func solution(_ plans:[[String]]) -> [String] {
    // 1. 시간 순 정렬
    let assignments: [Assignment] = plans.map {
        Assignment(name: $0[0], 
                   startTime: $0[1], 
                   playTime: Int($0[2])!)
    }.sorted(by: { 
        if $0.startTime.prefix(2) == $1.startTime.prefix(2) {
            return $0.startTime.suffix(2) < $1.startTime.suffix(2)
        } else {
            return $0.startTime.prefix(2) < $1.startTime.prefix(2)
        }
    })
    
    var waitingStack: [Assignment] = []
    var completedAssignmentNames: [String] = []
    var currentIndex = 0
    
    while currentIndex < plans.count - 1 {
        let nextIndex = currentIndex + 1
        var current: Assignment = assignments[currentIndex]
        let next: Assignment = assignments[nextIndex]
        // 2. 시간차 계산
        var useableTime = current.getTimeDiff(with: next) 
        
        // 2-1. 현재 시간 안에 완료할 수 있다면
        if current.playTime <= useableTime {
            completedAssignmentNames.append(current.name)
            useableTime -= current.playTime
            
            // 대기 큐에 있던 과제를 빼와서 진행
            // 그런데 딱 맞아 떨어지면 다음 과제로 넘어감
            while !waitingStack.isEmpty {
                if useableTime == 0 { break }
                
                var keep: Assignment = waitingStack.removeLast()
                
                if keep.playTime <= useableTime {
                    completedAssignmentNames.append(keep.name)
                    useableTime -= keep.playTime
                } else {
                    keep.playTime -= useableTime
                    waitingStack.append(keep)
                    break
                }
            }
        } else {
            // 2-2. 현재 시간 안에 완료할 수 없다면
            current.playTime -= useableTime
            waitingStack.append(current)
        }
        
        currentIndex += 1
    }
    
    // 3. 마지막 과제 후 대기 큐에 남은 것들 실행
    let last = assignments[currentIndex].name
    completedAssignmentNames.append(last)
    
    while !waitingStack.isEmpty {
        let keep = waitingStack.removeLast()
        completedAssignmentNames.append(keep.name)
    }
    
    
    return completedAssignmentNames
}

struct Assignment {
    let name: String
    let startTime: String
    var playTime: Int
    
    func getTimeDiff(with assignment: Assignment) -> Int {
        var timeDiff = 0
        
        timeDiff += ((Int(assignment.startTime.prefix(2))! - Int(startTime.prefix(2))! - 1) * 60 )
        timeDiff += ((Int(assignment.startTime.suffix(2))! - Int(startTime.suffix(2))!) + 60)
        
        return timeDiff
    }
}