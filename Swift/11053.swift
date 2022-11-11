let N = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: 0, count: N+1)

arr.insert(0, at: 0)

for i in 1...N {
    for j in 0..<i {
        if arr[j] < arr[i] { // 이전의 값들 중 현재 인덱스의 배열값보다 작으면서 최대인 값을 저장해놓고 그 값에+1한다.
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}
print(dp.max()!)