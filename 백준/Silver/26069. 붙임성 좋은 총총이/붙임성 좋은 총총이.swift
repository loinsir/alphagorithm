import Foundation

let N = Int(readLine()!)!

var dict = [String: Bool]()

var flag = false
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let (one, two) = (input[0], input[1])
    if !flag {
        if one == "ChongChong" || two == "ChongChong" {
            flag = true
            dict[one] = true
            dict[two] = true
        }
    } else {
        if dict[one] != nil && dict[one]! == true {
            dict[two] = true
        } else if dict[two] != nil && dict[two]! == true {
            dict[one] = true
        }
    }
}
var answer = 0
for (k, v) in dict {
    if v == true {
        answer += 1
    }
}
print(answer)