import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()

var result = Int.max
var one = 0, two = 0, three = 0

for k in 0..<N-2 {
    var start = k+1
    var end = N - 1
    
    while start < end {
        let target = arr[k] + arr[start] + arr[end]
        
        if abs(result) > abs(target) {
            result = target
            one = arr[k]
            two = arr[start]
            three = arr[end]
        }
        
        if target > 0 {
            end -= 1
        } else {
            start += 1
        }
    }
}

print([one, two, three].sorted().map { String($0) }.joined(separator: " "))