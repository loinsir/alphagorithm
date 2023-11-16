import Foundation

var candidateSet = Set<Int>()

func solution(_ numbers:String) -> Int {
    
    for i in 1...numbers.count {
        permutation(numbers, i).forEach {
            candidateSet.insert($0)
        }
    }

    return candidateSet.filter { 
        if $0 < 2 { return false }
        
        for i in 2..<Int(sqrt(Double($0)))+1 {
            if $0 % i == 0 { return false }
        }
        return true
    }.count
}

func permutation(_ target: String, _ targetNum: Int) -> Set<Int> {
    var result = Set<Int>()
    
    var check = [Bool](repeating: false, count: target.count)
    
    func permute(_ arr: String) {
        if arr.count == targetNum, let num = Int(arr) {
            result.insert(num)
            return
        }
        
        for i in 0..<target.count {
            if check[i] {
                continue
            }
            
            check[i] = true
            permute(arr + String(target[target.index(target.startIndex, offsetBy: i)]))
            check[i] = false
        }
    }
    
    permute("")
    return result
}