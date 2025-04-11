import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {

    var result: [Character] = []
    var lefthandPosition: Int = 10
    var righthandPosition: Int = 12
    let mainHand: Character = hand == "left" ? "L" : "R"
    
    for number in numbers {
        var num = number
        if number == 0 { num = 11 }
       
        switch num {
            case 1: fallthrough
            case 4: fallthrough
            case 7:
            result.append("L")
            lefthandPosition = num
            
            case 3: fallthrough
            case 6: fallthrough
            case 9:
            result.append("R")
            righthandPosition = num
            
            case 2: fallthrough
            case 5: fallthrough
            case 8: fallthrough
            case 11: 
            let distanceWithLefthand = getDistance(num, lefthandPosition)
            let distanceWithRighthand = getDistance(num, righthandPosition)
          
            if distanceWithLefthand < distanceWithRighthand {
                result.append("L")
                lefthandPosition = num
            } else if distanceWithLefthand > distanceWithRighthand {
                result.append("R")
                righthandPosition = num
            } else {
                result.append(mainHand)
                if mainHand == "L" { lefthandPosition = num }
                else { righthandPosition = num }
            }
            
            default: continue
        }
    }
    
    return String(result)
}

func getDistance(_ pos1: Int, _ pos2: Int) -> Int {
    let large = max(pos1, pos2)
    let small = min(pos1, pos2)
    
    switch large-small {
        case 1: fallthrough
        case 3:
        return 1
        
        case 2: fallthrough
        case 4: fallthrough
        case 6: 
        return 2
        
        case 5: fallthrough
        case 7: fallthrough
        case 9: 
        return 3
        
        case 8: fallthrough
        case 10: 
        return 4
        
        default:
        return -1
    }
}