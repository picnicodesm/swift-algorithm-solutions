import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {

    var q1 = queue1
    var q2 = queue2
    var sum1: UInt64 = UInt64(queue1.reduce(0, +))
    var sum2: UInt64 = UInt64(queue2.reduce(0, +))
    var head1 = 0
    var head2 = 0
    let target: UInt64 = (sum1 + sum2) / 2
    var globalMin = Int.max
    var count = 0
    
    while sum1 != sum2 {
        if sum1 < target {
            if head2 >= q2.count { return -1 }
            sum1 += UInt64(q2[head2])
            sum2 -= UInt64(q2[head2])
            q1.append(q2[head2])
            head2 += 1
        } else {
            if head1 >= q1.count { return -1 }
            sum2 += UInt64(q1[head1])
            sum1 -= UInt64(q1[head1])
            q2.append(q1[head1])
            head1 += 1
        }
        
        count += 1
        
        if count > (queue1.count + queue2.count) * 2 { return -1 }
    }

    return count
}