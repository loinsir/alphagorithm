import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var trucks = truck_weights 

    var time = 0
    var q = [(Int, Int)]()
    
    while !(q.isEmpty && trucks.isEmpty) {
        
        time += 1
        
        if let headTruck = q.first {
            if headTruck.1 <= time {
                q.removeFirst()
            }
        }
        
        if !trucks.isEmpty {
            let truck = trucks.first!
            if q.isEmpty {
                q.append((truck, time + bridge_length))
                trucks.removeFirst()
            } else {
                let currentWeights = q.reduce(0) { $0 + $1.0 }
                if currentWeights + truck <= weight {
                    q.append((truck, time + bridge_length))
                    trucks.removeFirst()
                }
            }
        }
    }
    
    return time
}