let n = Int(readLine()!)!

func solution(_ n:Int) -> Int {
    var chess = [Int].init(repeating: -1, count: n)
    var answer = 0

    func check(_ x: Int, _ y: Int) -> Bool {
        for i in 0..<x {
            if chess[i] == y || abs(x - i) - abs(y - chess[i]) == 0 { return false }
        }

        return true
    }

    func dfs(_ cnt: Int) {
        if cnt == n {
            answer += 1
            return
        }

        for i in 0..<n {
            if check(cnt, i) {
                chess[cnt] = i
                dfs(cnt + 1)
                chess[cnt] = -1
            }
        }
    }

    dfs(0)

    return answer
}

print(solution(n))
