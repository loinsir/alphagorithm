import Foundation

var answer = [[Int]]()

func solution(_ n:Int) -> [[Int]] {
    hanoi(n, 1, 3, 2)
    return answer
}

func hanoi(_ n: Int, _ start: Int, _ to: Int, _ via: Int) {
    if n == 1 {
        answer.append([start, to])
        return
    } else {
        hanoi(n-1, start, via, to)
        answer.append([start, to])
        hanoi(n-1, via, to, start)
    }
}