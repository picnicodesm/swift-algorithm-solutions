import Foundation

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var soldier = n
    var ticket = k
    var heap = MaxHeap<Int>()
    var stage = 0
    
    for enemyNum in enemy {
        soldier -= enemyNum
        heap.insert(enemyNum)
        
        if soldier < 0 {
            if ticket > 0 {
                soldier += heap.pop()!
                ticket -= 1
            } else  {
                break
            }
        }
        
        stage += 1
    }
    
    return stage
}

struct MaxHeap<T: Comparable> {
    var heap: [T] = []
    
    var peek: T? { heap.first }
    
    mutating func insert(_ element: T) {
        heap.append(element)
        var currentIndex = heap.count-1

        shiftUp(from: currentIndex)
    }
    
    mutating func pop() -> T? {
        if heap.isEmpty { return nil }
        
        if heap.count == 1 { return heap.removeLast() }
        else {
            let result = heap[0]
            heap[0] = heap.removeLast()
            shiftDown(from: 0)
            
            return result
        }
    }

    private mutating func shiftUp(from index: Int) {
        var currentIndex = index
        var parentIndex = (currentIndex - 1) / 2
        
        while currentIndex > 0 && heap[currentIndex] > heap[parentIndex] {
            heap.swapAt(currentIndex, parentIndex)
            currentIndex = parentIndex
            parentIndex = (currentIndex - 1) / 2
        }
    }
    
    private mutating func shiftDown(from index: Int, until endIndex: Int? = nil) {
        let limit = endIndex ?? heap.count
        var parentIndex = index
        
        while true {
            let leftChildIndex = parentIndex * 2 + 1
            let rightChildIndex = parentIndex * 2 + 2
            var candidateIndex = parentIndex
            
            if leftChildIndex < limit && heap[candidateIndex] < heap[leftChildIndex] {
                candidateIndex = leftChildIndex
            }
            
            if rightChildIndex < limit && heap[candidateIndex] < heap[rightChildIndex] {
                candidateIndex = rightChildIndex
            }
            
            if candidateIndex == parentIndex { return }
            
            heap.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}










