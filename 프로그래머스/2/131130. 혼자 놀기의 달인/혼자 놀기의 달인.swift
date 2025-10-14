import Foundation

func solution(_ cards:[Int]) -> Int {
    var maxScore = 0
    
    for firstSelect in 0..<cards.count {
        // play
        var opened = Array(repeating: false, count: cards.count)
        var nextSelect = cards[firstSelect] - 1
        var boxesInFirstGroup = 0
        var boxesInSecondGroup = 0
        
        opened[firstSelect] = true
        boxesInFirstGroup += 1
        
        while !opened[nextSelect] {
            opened[nextSelect] = true
            boxesInFirstGroup += 1
            nextSelect = cards[nextSelect] - 1
        }
        
        let allOpened = opened.allSatisfy { $0 == true }
        if allOpened { // game end with 0 score
            continue
        }
        
        // select second box in remaining boxes
        let temp = opened
        for secondSelect in 0..<cards.count {
            opened = temp
            boxesInSecondGroup = 0
            
            if opened[secondSelect] { continue }
            
            var nextSelect = cards[secondSelect] - 1
            
            opened[secondSelect] = true
            boxesInSecondGroup += 1
            
            while !opened[nextSelect] {
                opened[nextSelect] = true
                boxesInSecondGroup += 1
                nextSelect = cards[nextSelect] - 1
            }
            
            let score = boxesInFirstGroup * boxesInSecondGroup
            maxScore = max(maxScore, score)
        }
    }
    
    return maxScore
}