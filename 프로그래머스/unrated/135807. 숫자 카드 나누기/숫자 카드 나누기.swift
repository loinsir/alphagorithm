import Foundation

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    var answer = 0
    var arrA = arrayA.sorted(by: >)
    var arrB = arrayB.sorted(by: >)
    
    var gcdNumA = arrA[0]
    var gcdNumB = arrB[0]
    if arrA.count > 1 {
        for i in 1...arrA.count-1 {
            gcdNumA = gcd(gcdNumA, arrA[i])
        }
    }
    
    if arrB.count > 1 {
        for i in 1...arrB.count - 1 {
            gcdNumB = gcd(gcdNumB, arrB[i])
        }
    }
    
    var aFlag = false
    for i in 0..<arrB.count {
        if arrB[i] % gcdNumA == 0 {
            aFlag = true
            break
        }
    }
    
    if !aFlag {
        answer = max(answer, gcdNumA)
    }
    
    var bFlag = false
    for i in 0..<arrA.count {
        if arrA[i] % gcdNumB == 0 {
            bFlag = true
            break
        }
    }
    
    if !bFlag {
        answer = max(answer, gcdNumB)
    }
    
    return answer != 1 ? answer : 0
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a}
    return gcd(b, a % b)
}