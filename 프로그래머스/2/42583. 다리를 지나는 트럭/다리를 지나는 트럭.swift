import Foundation

struct Bridge {
    var queue: [Truck] = []
    var index = 0
    
    let maxWeight: Int
    let maxNumber: Int
    let length: Int
    
    var currentNumber = 0
    var currentWeight = 0
    var firstTruck: Truck? { isEmpty ? nil : queue[index] }
    var isEmpty: Bool { index >= queue.count }
    
    init(maxWeight: Int, maxNumber: Int) {
        self.maxWeight = maxWeight
        self.maxNumber = maxNumber
        length = maxNumber
    }
    
    mutating func takeOn(truck: Truck) {
        queue.append(truck)
        currentWeight += truck.weight
        currentNumber += 1
    }
    
    mutating func takeOffTruck() {
        currentWeight -= firstTruck!.weight
        currentNumber -= 1
        index += 1
    }
    
    func checkState(addWeight: Int) -> Bool {
        return (currentWeight + addWeight <= maxWeight) && (currentNumber + 1 <= maxNumber)
    }
    
    mutating func moveAllTrucks() {
        for i in index..<queue.count {
            queue[i].move()
        }
    }
}

struct Truck {
    let weight: Int
    var remainLength: Int
    
    mutating func move() { remainLength -= 1 }
}

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var time = 0
    var readyQueue = truck_weights
    var queueIndex = 0
    var bridge = Bridge(maxWeight: weight, maxNumber: bridge_length)
    
    while !(queueIndex >= readyQueue.count && bridge.isEmpty) {
        time += 1
        
        // 1. 다리에 트럭이 있는지 확인
        if let truck = bridge.firstTruck {
            let isCrossed = truck.remainLength == 0 // 첫 번째 차가 다리를 건넜는지 확인
            
            if isCrossed { bridge.takeOffTruck() }
        }
        
        // 2. 올릴 차가 있을 때, 트럭을 올릴 수 있는 상태인지 확인
        if queueIndex < readyQueue.count {
            let nextTruckWeight = readyQueue[queueIndex]
            let canStart = bridge.checkState(addWeight: nextTruckWeight)

            if canStart { // 올릴 수 있다면 올림
                let truck = Truck(weight: nextTruckWeight, remainLength: bridge.length)
                bridge.takeOn(truck: truck)
                queueIndex += 1
            }
        }
        
        // 3. 모든 트럭을 한 칸씩 이동
        bridge.moveAllTrucks()
    }
    
    return time
}