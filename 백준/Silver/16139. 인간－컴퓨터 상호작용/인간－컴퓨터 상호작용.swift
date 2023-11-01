import Foundation

let s = Array(readLine()!).map { String($0) }
let q = Int(readLine()!)!

var currentAlpha = ""
var l = 0, r = 0
var currentSum = 0

for _ in 1...q {
    let input = readLine()!.components(separatedBy: " ")
    let alpha = input[0]
    let tmpL = Int(input[1])!
    let tmpR = Int(input[2])!
    
    if alpha == currentAlpha {
        while l > tmpL {
            l -= 1
            if s[l] == alpha {
                currentSum += 1
            }
        }
        
        while l < tmpL {
            if s[l] == alpha {
                currentSum -= 1
            }
            l += 1
        }
        
        while r > tmpR {
            if s[r] == alpha {
                currentSum -= 1
            }
            r -= 1
        }
        
        while r < tmpR {
            r += 1
            if s[r] == alpha {
                currentSum += 1
            }
        }
    } else {
        currentAlpha = alpha
        currentSum = 0
        l = tmpL
        r = tmpR
        for i in l...r {
            if s[i] == alpha {
                currentSum += 1
            }
        }
    }
    print(currentSum)
}