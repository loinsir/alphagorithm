import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var start = 1
var end = n * n

while start < end {
    let mid = (start + end) / 2
    var count = 0
    
    for i in 1...n {
        count += min(mid / i, n)
    }
    
    if (count < k) {
        start = mid + 1
    } else {
        end = mid
    }
}

print(start)