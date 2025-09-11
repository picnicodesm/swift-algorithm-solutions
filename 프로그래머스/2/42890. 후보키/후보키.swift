import Foundation

func solution(_ relation:[[String]]) -> Int {
    let indices = getCombinations(n: relation[0].count)
    var privateKeys: Set<[Int]> = []
    var privateKeyTestFlag = true

    for indexSet in indices {
        let testRelation = filter(relation: relation, indexSet: indexSet)
        let testResult = uniqueTest(relation: testRelation)
        
        if testResult {
            privateKeyTestFlag = true
            
            if privateKeys.isEmpty {
                privateKeys.insert(indexSet)
                continue
            }
            
            for privateKey in privateKeys {
                if Set(privateKey).isSubset(of: indexSet) {
                    privateKeyTestFlag = false
                    break
                }
            }
            
            if privateKeyTestFlag {
                privateKeys.insert(indexSet)
            }
        }
    }
    
    return privateKeys.count
}

func uniqueTest(relation: [[String]]) -> Bool {
    var c1: [String] = []
    var c2: [String] = []
    
    for compare1Index in 0..<relation.count {
        c1 = relation[compare1Index]
        for compare2Index in (compare1Index+1)..<relation.count {
            c2 = relation[compare2Index]
            if c1 == c2 { return false }
        }
    }
    
    return true
}

func filter(relation: [[String]], indexSet: [Int]) -> [[String]] {
    
    var filteredRelation: [[String]] = relation.map { 
        var row: [String] = []
        
        for index in indexSet {
            row.append($0[index-1])
        }
        
        return row
    }
    
    return filteredRelation
}

func getCombinations(n: Int) -> [[Int]] {
    var totalCombi: [[Int]] = []

    for k in 1...n {
        let combi = getCombination(n: n, k: k)
        totalCombi += combi
    }

    return totalCombi
}

func getCombination(n: Int, k: Int) -> [[Int]] {
    var combi: [[Int]] = []
    var stack: [(combi: [Int], length: Int)] = []
    
    stack.append(([], 0))
    
    while !stack.isEmpty {
        let currentCombi = stack.removeLast()
        
        if currentCombi.length == k {
            combi.append(currentCombi.combi)
            continue
        }
        
        let last = currentCombi.combi.last ?? 0
        if last >= n { continue }
        
        for newElement in (last+1)...n {
            let newCombi = currentCombi.combi + [newElement]
            let newLength = currentCombi.length + 1
            
            stack.append((newCombi, newLength))
        }
    }
    
    return combi
}