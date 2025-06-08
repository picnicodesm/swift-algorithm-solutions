import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var skill: [Character] = Array(skill)
    let skillSet: Set<Character> = Set(skill)
    var result = 0
    var currentIndex = 0
    
    for skill_tree in skill_trees {
        currentIndex = 0
        
        for c in skill_tree {
            if skillSet.contains(c) {
                if c == skill[currentIndex] {
                    currentIndex += 1
                } else {
                    result -= 1
                    break
                }
            } else { continue }
        }
        
        result += 1
    }
    
    return result
}