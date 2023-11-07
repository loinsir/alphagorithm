let ns = readLine()!.split(separator: " ").map { Int($0)! }
let n = ns[0], s = ns[1]
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var count = [Int: Int]()
var answer = 0

// 앞 절반 부분의 부분 집합의 합을 이루는 개수를 구해나간다.
func left_dfs(_ current: Int, _ end: Int, _ sum: Int) {
    if current == end {
        count[sum, default: 0] += 1
        return
    }
    left_dfs(current+1, end, sum) // 현재 원소를 더하지 않는 경우
    left_dfs(current+1, end, sum + arr[current]) // 현재 원소를 더하는 경우
}

func right_dfs(_ current: Int, _ end: Int, _ sum: Int) {
    if current == end {
        if count[s-sum, default: 0] > 0 {
            answer += count[s-sum, default: 0]
        } else if sum == s {
            answer += 1
        }
        return
    }
    right_dfs(current+1, end, sum)
    right_dfs(current+1, end, sum + arr[current])
}

left_dfs(0, n/2, 0)
right_dfs(n/2, n, 0)

if s == 0{
    answer -= 1
}

print(answer)