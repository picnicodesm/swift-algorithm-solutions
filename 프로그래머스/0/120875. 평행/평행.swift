import Foundation

func solution(_ dots:[[Int]]) -> Int {
    for i in 0..<dots.count-1 {
        for j in i+1..<dots.count {
            let other = [0, 1, 2, 3].filter{ $0 != i && $0 != j }
            
            let dot1 = dots[i]
            let dot2 = dots[j]
            let dot3 = dots[other[0]]
            let dot4 = dots[other[1]]

            let lean1 = Double(dot2[1] - dot1[1]) / Double(dot2[0] - dot1[0])
            let lean2 = Double(dot4[1] - dot3[1]) / Double(dot4[0] - dot3[0])
            if lean1 == lean2 { return 1 }
        }
    }
    
    return 0
}

// 두 직선이 평행이 되려면 
// 기울기가 같아야 해.