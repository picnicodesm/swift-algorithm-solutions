import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    // set dictionary for friendsIndex
        // set giftScore and result
    var dic: [String: Int] = [:]
    var giftScore: [String: Int] = [:]
    var result: [String: Int] = [:]
    let _ = friends.enumerated().map { 
        dic[$0.element] = $0.offset
        giftScore[$0.element] = 0
        result[$0.element] = 0
    }
    
    // set chart of giveAndTake and calculate giftScore
    var gatChart = Array(repeating: Array(repeating: 0, count: friends.count), count: friends.count)
    
    for content in gifts {
        let gat = content.split(separator: " ").map { String($0) }

        guard let giverIndex = dic[gat[0]], let takerIndex = dic[gat[1]] else { return -1 }
        
        gatChart[giverIndex][takerIndex] += 1
        giftScore[gat[0]]! += 1
        giftScore[gat[1]]! -= 1
    }

    // calculate
    for giverIndex in 0..<gatChart.count {
        for takerIndex in giverIndex..<gatChart[giverIndex].count {
            if giverIndex == takerIndex { continue }
            let giver = friends[giverIndex]
            let taker = friends[takerIndex]
            
            if gatChart[giverIndex][takerIndex] > gatChart[takerIndex][giverIndex] {
                // giver가 준게 더 많을 경우
                result[giver]! += 1
            } else if gatChart[giverIndex][takerIndex] < gatChart[takerIndex][giverIndex] {
        // taker가 준게 더 많을 경우
            result[taker]! += 1
        } else {
        // 같을 경우: 선물 지수 확인
                if giftScore[giver]! > giftScore[taker]! {
                    result[giver]! += 1
                } else if giftScore[giver]! < giftScore[taker]! {
                    result[taker]! += 1
                } else { }
            }
        }
    }
    
    
    return result.values.max()!
}