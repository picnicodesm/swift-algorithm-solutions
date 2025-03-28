import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failRates: [StageFailRate] = []
    let orderedStages = stages.sorted(by: >)
    
    var currentStage = N
    var nopOfFailed: Double = 0.0
    var nopOfPassed: Double = 0.0
    
    for failStage in orderedStages {
        if failStage > N { 
            nopOfPassed += 1.0
            continue 
        }
        
        if failStage != currentStage {
            while currentStage > failStage {
                if nopOfFailed == 0.0 {
                    failRates.append(StageFailRate(stage: currentStage, failRate: 0.0))
                } else {
                    failRates.append(StageFailRate(stage: currentStage, failRate: nopOfFailed / nopOfPassed))
                }
                currentStage -= 1
                nopOfFailed = 0.0
            }
        }
        nopOfFailed += 1.0
        nopOfPassed += 1.0
    }
    
    while currentStage > 0 {
                if nopOfFailed == 0.0 {
                    failRates.append(StageFailRate(stage: currentStage, failRate: 0.0))
                } else {
                    failRates.append(StageFailRate(stage: currentStage, failRate: nopOfFailed / nopOfPassed))
                }
        currentStage -= 1
        nopOfFailed = 0.0
    }

    
    print(failRates)

    return failRates.sorted { 
        return $0.failRate == $1.failRate ? $0.stage < $1.stage : $0.failRate > $1.failRate
    }.map { $0.stage }
}

struct StageFailRate {
    let stage: Int
    let failRate: Double
}