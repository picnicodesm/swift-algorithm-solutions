import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var result = 0
    var emptyBottle = n
    
    while emptyBottle >= a {
        let change = emptyBottle / a * b
        emptyBottle = (emptyBottle%a) + change
        result += change
    }
    
    return result
}