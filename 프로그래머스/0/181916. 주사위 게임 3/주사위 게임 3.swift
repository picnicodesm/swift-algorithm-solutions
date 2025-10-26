import Foundation
import CoreFoundation

func solution(_ a:Int, _ b:Int, _ c:Int, _ d:Int) -> Int {
    let numArr = [a, b, c, d].sorted()
    let numSet: Set<Int> = Set(numArr)
    
    if numSet.count == 1 {
        return 1111 * a
    } else if numSet.count == 2 {
        let arr = Array(numSet).sorted()
        var p = 0
        var q = 0
        if numArr.filter({ $0 == arr[0] }).count == 3 {
            p = arr[0]
            q = arr[1]
            return (10 * p + q) * (10 * p + q)
        } else if numArr.filter({ $0 == arr[1] }).count == 3 {
            p = arr[1]
            q = arr[0]
            return (10 * p + q) * (10 * p + q)
        } else {
            p = arr[0]
            q = arr[1]
            return (p + q) * abs(p - q)
        }
    } else if numSet.count == 3 {
        let arr = Array(numSet).sorted()
        if numArr.filter({$0 == arr[0]}).count == 2 {
            return arr[1] * arr[2]
        } else if numArr.filter({$0 == arr[1]}).count == 2 {
            return arr[0] * arr[2]
        } else {
            return arr[0] * arr[1]
        }
    } else {
        return numArr[0]
    }
}