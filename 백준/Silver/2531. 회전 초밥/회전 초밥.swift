import Foundation

let info = readLine()!.split(separator: " ").map { Int(String($0))! }
var foods: [Int] = []

for _ in 0..<info[0] {
    let food = Int(readLine()!)!
    foods.append(food)
}

solution(info, foods)

func solution(_ info: [Int], _ foods: [Int]) {
    let windowSize = info[2]
    let couponNumber = info[3]
    let foodsCount = foods.count
    var eatenFoodDic: [Int: Int] = [:]
    var result = 0
    
    for index in 0..<windowSize {
        if eatenFoodDic[foods[index]] != nil {
            eatenFoodDic[foods[index]]! += 1
        } else {
            eatenFoodDic[foods[index]] = 1
        }
    }
    
    if eatenFoodDic[couponNumber] != nil {
        if result < eatenFoodDic.count {
            result = eatenFoodDic.count
        }
    } else {
        if result < eatenFoodDic.count + 1 {
            result = eatenFoodDic.count + 1
        }
    }
    
    for index in 1..<foodsCount {
        let newEatenFoodIndex = (index + windowSize - 1) % foodsCount
        let removeIndex = index - 1
        if eatenFoodDic[foods[newEatenFoodIndex]] != nil {
            eatenFoodDic[foods[newEatenFoodIndex]]! += 1
        } else {
            eatenFoodDic[foods[newEatenFoodIndex]] = 1
        }
        
        if eatenFoodDic[foods[removeIndex]]! - 1 == 0 {
            eatenFoodDic[foods[removeIndex]] = nil
        } else {
            eatenFoodDic[foods[removeIndex]]! -= 1
        }
        
        if eatenFoodDic[couponNumber] != nil {
            if result < eatenFoodDic.count {
                result = eatenFoodDic.count
            }
        } else {
            if result < eatenFoodDic.count + 1 {
                result = eatenFoodDic.count + 1
            }
        }
    }
    
    print(result)
}