import Foundation

func solution(_ s:String) -> Bool
{
    var ans:Bool = false
    var countP = 0
    var countY = 0
    let _ = s.uppercased().map {
        if $0 == "P" { countP += 1}
        if $0 == "Y" { countY += 1}
    }

    return countP == countY
}