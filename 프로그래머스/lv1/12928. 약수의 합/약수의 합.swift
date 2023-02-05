func solution(_ n:Int) -> Int {
    if n == 0 { return 0 }
    
    if n == 1 { return 1 }
    
    var result = [Int]()
    for i in 1...(n/2) {
        if n % i == 0 { 
            result.append(i)
        }
        
        if i == (n/2) {
            result.append(n)
            break
        }
    }
    return result.reduce(0, +)
}