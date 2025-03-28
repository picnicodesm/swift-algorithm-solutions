import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = -1
    
    var total: Int64 = 0
    for currentPrice in stride(from: price, through: price * count, by: price) {
        total += Int64(currentPrice)
    }
    
    answer = money > total ? 0 : total - Int64(money)
    
    return answer
}