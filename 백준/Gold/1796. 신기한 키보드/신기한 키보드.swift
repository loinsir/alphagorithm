import Foundation

let s = Array(readLine()!)

var dp = Array(repeating: Array(repeating: -1, count: 50), count: 1001) // i 번째 부터, 현재 위치가 j 일때 필요한 최소 이동 횟수
var low = Array(repeating: 10000000, count: 27) // 문자의 가장 처음 위치 저장
var high = Array(repeating: 0, count: 27) // 문자의 가장 나중 위치 저장
var exist = Array(repeating: false, count: 26) // 해당 문자가 이전에 존재하는지 여부

func dist(_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> Int { // 현재 위치 a 에서 c, d를 방문하고 b까지 가기 위해 필요한 최소 이동 거리
    if c == -1 || d == -1 { return 0}
    
    let A = abs(a-c) // 시작점 a 에서 c까지
    let B = abs(c-d) // c 에서 d까지
    let C = abs(d-b) // d 에서 목적지 b까지
    return A+B+C
}

func solve(_ alpha: Int, _ pos: Int) -> Int { // alpha 번째 알파벳의 , pos번째 위치에 도달하는데 걸리는 최소 이동 거리
    if alpha == 26 { return 0 } // 인덱스 벗어남 처리
    if dp[alpha][pos] != -1 { return dp[alpha][pos] }
    dp[alpha][pos] = Int.max
    let posl = low[alpha] // 해당 알파벳이 등장하는 가장 왼쪽 위치
    let posr = high[alpha] // 해당 알파벳이 등장하는 가장 오른쪽 위치
    
    if exist[alpha] { // 이전 위치에 해당 알파벳 존재 할 경우
        //  최소 이동 거리 = 다음 번째 알파벳의 최소 이동 거리 + pos에서 부터 양 끝 알파벳 위치에 방문하고 난 최소 이동 거리
        for i in 0..<s.count {
            dp[alpha][pos] = min(dp[alpha][pos], solve(alpha+1,i) + min(dist(pos, i, posl, posr), dist(pos, i, posr, posl)))
        }
    } else { // 이전 위치에 해당 알파벳 존재하지 않을 경우
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