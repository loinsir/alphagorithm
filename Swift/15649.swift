let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1]

var visited = Array(repeating: false, count: N + 1)

for i in 1...N {
    visited[i] = true
    dfs([i])
    visited[i] = false
}

func dfs(_ nums: [Int]) {
    if nums.count == M {
        for i in nums {
            print(i, terminator: " ")
        }
        print("")
        return
    }

    for i in 1...N {
        if !visited[i] {
            visited[i] = true
            var nums = nums
            nums.append(i)
            dfs(nums)
            visited[i] = false
        }
    }
}
