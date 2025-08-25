import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    let col = col - 1
    let orderedTable = data.sorted(by: {
        if $0[col] == $1[col] {
            return $0[0] > $1[0]
        } else {
            return $0[col] < $1[col]
        }
    })

    let s_i: [Int] = orderedTable.enumerated().map { (index, row) in
        return row.map { $0 % (index + 1) }.reduce(0, +)
    } 
    
    let hashValue = Array(s_i[row_begin-1..<row_end]).reduce(0, ^)
    
    return hashValue
}