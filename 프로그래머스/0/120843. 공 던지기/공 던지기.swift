import Foundation

func solution(_ numbers:[Int], _ k:Int) -> Int {
    var currentPlayer = 0
    var count = 1
    
    while count < k {
        currentPlayer = (currentPlayer + 2) % numbers.count
        count += 1
    }
    
    
    return currentPlayer + 1
}