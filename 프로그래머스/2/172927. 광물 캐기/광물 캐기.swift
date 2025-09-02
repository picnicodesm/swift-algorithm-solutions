import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    
    var totalPicks = picks.reduce(0, +)
    var mineralChunks: [(diamond: Int, iron: Int, stone: Int)] = []
    
    // 광물을 5개씩 묶어서 다이아몬드, 철, 돌의 개수 계산
    for i in stride(from: 0, to: minerals.count, by: 5) {
        if totalPicks <= 0 { break } // 곡괭이 개수만큼만 처리
        
        var chunk: (diamond: Int, iron: Int, stone: Int) = (0, 0, 0)
        let chunkEnd = min(i + 5, minerals.count)
        
        for j in i..<chunkEnd {
            let mineral = minerals[j]
            switch mineral {
            case "diamond":
                chunk.diamond += 1
            case "iron":
                chunk.iron += 1
            case "stone":
                chunk.stone += 1
            default:
                break
            }
        }
        mineralChunks.append(chunk)
        totalPicks -= 1
    }
    
    // 다이아몬드, 철, 돌 순으로 내림차순 정렬
    mineralChunks.sort {
        if $0.diamond != $1.diamond {
            return $0.diamond > $1.diamond
        }
        if $0.iron != $1.iron {
            return $0.iron > $1.iron
        }
        return $0.stone > $1.stone
    }
    
    var totalFatigue = 0
    var currentPicks = picks
    
    // 정렬된 광물 덩어리를 순회하며 최소 피로도 계산
    for chunk in mineralChunks {
        if currentPicks[0] > 0 { // 다이아몬드 곡괭이가 있을 경우
            totalFatigue += chunk.diamond * 1 + chunk.iron * 1 + chunk.stone * 1
            currentPicks[0] -= 1
        } else if currentPicks[1] > 0 { // 철 곡괭이가 있을 경우
            totalFatigue += chunk.diamond * 5 + chunk.iron * 1 + chunk.stone * 1
            currentPicks[1] -= 1
        } else if currentPicks[2] > 0 { // 돌 곡괭이가 있을 경우
            totalFatigue += chunk.diamond * 25 + chunk.iron * 5 + chunk.stone * 1
            currentPicks[2] -= 1
        }
    }
    
    return totalFatigue
}

