import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    let saleProportions = [10, 20, 30, 40]
    let emoticonSaleProportions: [[Int]] = permutation(of: saleProportions, length: emoticons.count)
    var result: [Int] = [0, 0]
        
    for emoticonSaleProportion in emoticonSaleProportions { // [10, 10, 10, 10], count: 4
        var emoticonPlusUserCount = 0
        var saledMoney = 0    
        
        for user in users {
            let proportionToBuy = user[0] // 이 비율을 넘으면 이 할인율 이상의 이모티콘 모두 구매
            var limitToBuy = user[1] // 이 값을 넘으면 이모티콘 플러스 가입
        
            let usedMoney = getUsedMoney(to: emoticons, 
                                         proportion: emoticonSaleProportion, 
                                         limit: proportionToBuy)
            
            if usedMoney >= limitToBuy {
                emoticonPlusUserCount += 1
            } else {
                saledMoney += usedMoney
            }
        }

        if emoticonPlusUserCount > result[0] ||
        (emoticonPlusUserCount == result[0] && saledMoney > result[1]) {
            result = [emoticonPlusUserCount, saledMoney]
        }
    }
    
    return result
}

func permutation(of arr: [Int], length: Int) -> [[Int]] {
    var results: [[Int]] = []
    var stack: [[Int]] = []
    
    for n in arr {
        stack.append([n])
    }
    
    while !stack.isEmpty {
        let permutation = stack.removeLast()
        
        if permutation.count == length {
            results.append(permutation)
            continue
        }
        
        for n in arr {
            let newPermutation = permutation + [n]
            stack.append(newPermutation)
        }
    }
    
    return results
}

func getUsedMoney(to emoticons: [Int], proportion: [Int], limit: Int)  -> Int {
    var usedMoney = 0
    
    for (origin, saleProp) in zip(emoticons, proportion) {
        if saleProp >= limit {
            let saledPrice = origin - (origin * saleProp / 100)
            usedMoney += saledPrice
        }
    }
    
    return usedMoney
}
