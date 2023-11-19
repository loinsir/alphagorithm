import Foundation

func solution(_ order:[Int]) -> Int {
    
    var answer = 0
    var belt = Array(Array(1...order.count).reversed())
    var stack = [Int]()
    
    for item in order {

        if belt.count > 0 && belt.last! == item {
            answer += 1
            belt.removeLast()
        } else {
            
            if stack.count > 0 && stack.last! == item {
                stack.removeLast()
                answer += 1
                continue
            }
            
            while belt.count > 0 && belt.last! != item, let popped = belt.popLast() {
                stack.append(popped)
            }
            
            if belt.count > 0 && belt.last! == item {
                answer += 1
                belt.removeLast()
            } else {
                return answer
            }
        }
        
    }
    
    return answer
}