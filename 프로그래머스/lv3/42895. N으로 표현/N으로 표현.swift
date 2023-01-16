import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    if number == 1 {
        return 1
    }
    
    var memoization = [Set<Int>]()
    
    for i in 1...8 {
        var tempSet = Set<Int>()
        tempSet.insert(Int(String(repeating: "\(N)", count: i))!)
        
        if i > 1 {
            for j in 1...i-1 {
                for op1 in memoization[j-1] {
                    for op2 in memoization[i-j-1] {
                        tempSet.insert(op1 + op2)
                        tempSet.insert(op1 - op2)
                        tempSet.insert(op1 * op2)
                        if op2 != 0 {
                            tempSet.insert(op1 / op2)
                        }
                    }
                }
            }
        }
        
        if tempSet.contains(number) {
            return i
        }
        memoization.append(tempSet)
    }
    
    return -1
}