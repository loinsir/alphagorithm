import Foundation

let s = Array(readLine()!)

var dp = Array(repeating: Array(repeating: -1, count: 50), count: 1001)
var low = Array(repeating: 10000000, count: 27) // 문자의 가장 처음 위치
var high = Array(repeating: 0, count: 27) // 문자의 가장 나중 위치
var exist = Array(repeating: false, count: 26)

func dist(_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> Int { // 현재 위치 a 에서 c, d를 방문하고 b까지 가기 위해 필요한 최소 이동 거리
    if c == -1 || d == -1 { return 0}
    
    let A = abs(a-c) // 시작점 a 에서 c까지
    let B = abs(c-d) // c 에서 d까지
    let C = abs(d-b) // d 에서 목적지 b까지
    return A+B+C
}

func solve(_ alpha: Int, _ pos: Int) -> Int {
    if alpha == 26 { return 0 }
    if dp[alpha][pos] != -1 { return dp[alpha][pos] }
    dp[alpha][pos] = Int.max
    let posl = low[alpha]
    let posr = high[alpha]
    
    if exist[alpha] {
        for i in 0..<s.count {
            dp[alpha][pos] = min(dp[alpha][pos], solve(alpha+1,i) + min(dist(pos, i, posl, posr), dist(pos, i, posr, posl)))
        }
    } else {
        dp[alpha][pos] = solve(alpha + 1, pos)
    }
    
    return dp[alpha][pos]
}

for i in 0..<26 {
    for j in 0..<s.count {
        if s[j].asciiValue! - Character("a").asciiValue! == i {
            exist[i] = true
            low[i] = min(low[i], j)
            high[i] = max(high[i], j)
        }
    }
}
    
let result = solve(0, 0)

print(s.count + result)