import Foundation

func solution(_ topping:[Int]) -> Int {
    var answer = 0
    var toppingDict = [Int: Int]()
    var brotherDict = [Int: Int]()
    
    for top in topping {
        if toppingDict[top] == nil {
            toppingDict[top] = 1
        } else {
            toppingDict[top]! += 1
        }
    }
    
    for i in stride(from: topping.count - 1, through: 0, by: -1) {
        
        if brotherDict[topping[i]] == nil {
            brotherDict[topping[i]] = 1
        } else {
            brotherDict[topping[i]]! += 1
        }
        
        toppingDict[topping[i]]! -= 1
        
        if toppingDict[topping[i]]! == 0 {
            toppingDict[topping[i]] = nil
        }
        
        if toppingDict.keys.count == brotherDict.keys.count {
            answer += 1
        }
    }
    
    return answer
}