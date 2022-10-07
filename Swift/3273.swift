import Foundation

let n = Int(readLine()!)!
var list = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let x = Int(readLine()!)!
list.sort()

var i = 0
var j = n-1
var result = 0

while i < j {
    let sum = list[i] + list[j]
    if sum == x {
        result += 1
        if list[i+1] + list[j] > sum {
            j -= 1
        } else {
            i += 1
        }
    } else if sum > x {
        j -= 1
    } else if sum < x {
        i += 1
    }
}
print(result)