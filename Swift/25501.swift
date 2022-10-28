let T = Int(readLine()!)!
var count = 1
var result: [String] = []
for _ in 1...T {
    let S = readLine()!
    var s: [String] = []
    for char in S {
        s.append(String(char))
    }
    result.append("\(isPalindrome(s)) \(count)")
    count = 1
}

for i in result {
    print(i)
}

func isPalindrome(_ s: [String]) -> Int {
    var left = 0
    var right = s.count - 1

    while left < right {
        if s[left] == s[right] {
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