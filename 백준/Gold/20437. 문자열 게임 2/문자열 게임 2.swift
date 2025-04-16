import Foundation

struct AlphabetBlock {
    let alphabet: Character
    var firstIndexInIndices: Int
    var lastIndexInIndices: Int
    var indices: [Int]
    var isSatisfied: Bool
    var count: Int
    var length: Int {
        if isSatisfied {
            return indices[lastIndexInIndices] - indices[firstIndexInIndices] + 1
        }
        return -1
    }
    
    init(_ alphabet: Character,
         firstIndexInIndices: Int = -1,
         lastIndexInIndices: Int = -1,
         indices: [Int] = [],
         isSatisfied: Bool = false,
         count: Int = 0) {
        self.alphabet = alphabet
        self.firstIndexInIndices = firstIndexInIndices
        self.lastIndexInIndices = lastIndexInIndices
        self.indices = indices
        self.isSatisfied = isSatisfied
        self.count = count
    }
    
    mutating func newCharAppeared(_ index: Int) {
        indices.append(index)
        count += 1
        if firstIndexInIndices < 0 {
            firstIndexInIndices = 0
            lastIndexInIndices = 0 }
        else {
            if self.isSatisfied {
                firstIndexInIndices += 1
                lastIndexInIndices += 1
            } else {
                lastIndexInIndices += 1
            }
        }
    }
}

let N = Int(readLine()!)!

for _ in 0..<N {
    let string = readLine()!
    let k = Int(readLine()!)!
    
    solution(string, k)
}

func solution(_ string: String, _ k: Int) {
    let count = string.count
    var maxLength = -1
    var minLength = count
    
    var blocks: [AlphabetBlock] = Array(97...122).map {
        let c = Character(UnicodeScalar($0)!)
        let block = AlphabetBlock(c)
        return block
        }
    
    for (index, c) in string.enumerated() {
        let blockIndex = Int(c.asciiValue!) - 97
        
        blocks[blockIndex].newCharAppeared(index)
        if blocks[blockIndex].count >= k { blocks[blockIndex].isSatisfied = true }
        let length = blocks[blockIndex].length
        if length > 0 {
            if maxLength < length { maxLength = length }
            if minLength > length { minLength = length }
        }
    }
    
    if maxLength == -1 && minLength == count {
        print(-1)
    } else {
        print(minLength, maxLength)
    }
}