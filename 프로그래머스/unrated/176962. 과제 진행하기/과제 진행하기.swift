import Foundation

struct Assign: Comparable {
    let name: String
    let time: Int
    var during: Int
    
    static func < (lhs: Assign, rhs: Assign) -> Bool {
        return lhs.time < rhs.time
    }
    
    init(_ name: String, _ time: Int, _ during: Int) {
        self.name = name
        self.time = time
        self.during = during
    }
}

func solution(_ plans:[[String]]) -> [String] {
    var answer = [String]()
    var sortedPlans = [Assign]()
    
    for plan in plans {
        sortedPlans.append(Assign(plan[0], strToTime(plan[1]), Int(plan[2])!))
    }
    sortedPlans.sort() // 시간 순 정렬
    
    var stack = [Assign]()
    for i in 0..<sortedPlans.count {
        let curPlan = sortedPlans[i]
        
        if !stack.isEmpty { // 스택에 값 들어있다면
            let popped = stack.removeLast()
            var extraTime = curPlan.time - popped.time // 이전과 현재 간극
            
            if extraTime < popped.during { // 현재까지도 이전 과목을 못 마치는 경우 다시 스택에 넣기
                stack.append(Assign(popped.name, popped.time, popped.during - extraTime))
            } else {
                answer.append(popped.name)
                extraTime -= popped.during
                
                while !stack.isEmpty && extraTime > 0 {
                    let aPopped = stack.removeLast()
                    if extraTime < aPopped.during {
                        stack.append(Assign(aPopped.name, aPopped.time, aPopped.during - extraTime))
                        break
                    } else {
                        answer.append(aPopped.name)
                        extraTime -= aPopped.during
                    }
                }
                
            }
        }
        
        stack.append(curPlan)
    }
    
    while !stack.isEmpty {
        answer.append(stack.removeLast().name)
    }
    
    return answer
}

func strToTime(_ str: String) -> Int {
    let input = str.split(separator: ":").map { Int(String($0))! }
    return input[0] * 60 + input[1]
}
