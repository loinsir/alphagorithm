let n = Int(readLine()!)!
var arr: [Int] = [0]
for _ in 1...n {
    let input = Int(readLine()!)!
    arr.append(input)
}

var dp = Array(repeating: 0, count: n+1)

if n == 1 {
    print(arr[1])
} else if n == 2 {
    print(arr[1] + arr[2])
} else if n == 3 {
    print(max(arr[1] + arr[3], arr[2] + arr[3]))
} else {
    dp[1] = arr[1]
    dp[2] = max(arr[1] + arr[2], arr[2])
    dp[3] = max(arr[1] + arr[3], arr[2] + arr[3])

    for i in 4...n { // 핵심 점화식
        dp[i] = max(arr[i] + dp[i-2], arr[i] + arr[i-1] + dp[i-3])
    }
    print(dp.last!)
}