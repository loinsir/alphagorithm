// 맞았는데 시간초과임...

let T = Int(readLine()!)!
var count = 1
var result: [String] = []
for _ in 1...T {
    let S = readLine()!
    result.append("\(isPalindrome(S)) \(count)")
    count = 1
}

for i in result {
    print(i)
}

func isPalindrome(_ s: String) -> Int {
    var left = 0
    var right = s.count - 1

    while left < right {
        if s[s.index(s.startIndex, offsetBy: left)] == s[s.index(s.startIndex, offsetBy: right)] {
            count += 1
            left += 1
            right -= 1
        } else {
            return 0
        }
    }

    if left < right {
        count += 1
    }

    return 1
}