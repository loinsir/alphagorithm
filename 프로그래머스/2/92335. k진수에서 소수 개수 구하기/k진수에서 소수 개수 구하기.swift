import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let convertedN = String(n, radix: k).split(separator: "0").compactMap { Int($0) }.filter { $0 != 1 }
    var answer = 0
    
    for num in convertedN {
        var flag = false
        if num == 2 || num == 3 { 
            answer += 1
            continue
        }
        for i in 2...Int(sqrt(Double(num))) {
            if num % i == 0 { 
                flag = true
                break
            } 
        }
        if !flag { answer += 1 }
    }
    
    return answer
}