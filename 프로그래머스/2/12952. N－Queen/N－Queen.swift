import Foundation

var board = [[Int]]()
var tmp = [Int]()
var answer = 0
var N = 0

func solution(_ n:Int) -> Int {
    N = n
    board = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    tmp = [Int](repeating: 0, count: n * n)
    
    for i in 0..<n {
        tmp[0] = i
        dfs(1)
    }
    
    return answer
}

func dfs(_ col: Int) {

    if col == N {
        answer += 1
        return
    }
    
    for i in 0..<N {
        var check = true
        
        for j in 0..<col {
            tmp[col] = i
            if tmp[j] == tmp[col] || (j - col) == (tmp[j] - tmp[col])
            || (j - col) == (tmp[col] - tmp[j]) {
                check = false
                break
            }
        }
        
        if check {
            dfs(col + 1)
        }
    }
}