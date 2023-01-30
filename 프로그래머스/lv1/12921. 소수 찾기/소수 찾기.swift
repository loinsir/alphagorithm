import Foundation

func solution(_ n:Int) -> Int {
    var count = 0
    
    func isPrime(_ num: Int) -> Bool {
        if num < 4 {
            return true
        }
        
        for i in 2...Int(sqrt(Double(num))) {
            if num % i == 0 {
                return false
            }
        }
        
        return true
    }
    
    for i in 2...n {
        if isPrime(i) {
            count += 1
        }
    }
    return count
}