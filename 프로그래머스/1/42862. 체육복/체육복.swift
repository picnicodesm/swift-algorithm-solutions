import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    var lostSet = Set(lost).subtracting(reserve)
    let reserveSet = Set(reserve).subtracting(lost)
    
    for closet in reserveSet.sorted() {
        if lostSet.contains(closet-1) { lostSet.remove(closet-1) } 
        else if lostSet.contains(closet+1) { lostSet.remove(closet+1) }
    }

    return n - lostSet.count
}