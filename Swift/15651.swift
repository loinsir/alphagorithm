let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]

var visited = Array(repeating: false, count: N + 1)
var result = ""

for i in 1...N {
    dfs([i])
}
print(result)

func dfs(_ nums: [Int]) {

    if nums.count == M {
        result += nums.map { String($0) }.joined(separator: " ")
        result += "\n"
        return
    }

    for i in 1...N {
        if !visited[i] {
            var nums = nums
            nums.append(i)
            if nums.count == M {
                visited[i] = true
            }
            dfs(nums)
            if visited[i] {
                visited[i] = false
            }
        }
    }
}
