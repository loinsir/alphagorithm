import Foundation

let nc = readLine()!.split(separator: " ").map { Int($0)! }
let n = nc[0], c = nc[1]

let arr = readLine()!.split(separator: " ").map { Int($0)! }
var leftSums = [Int]()
var rightSums = [Int]()

func dfs(_ current: Int, _ end: Int, _ sum: Int, _ array: inout [Int]) {
    if sum > c {
        return
    }
    
    if current == end {
        array.append(sum)
        return
    }
    
    dfs(current + 1, end, sum + arr[current], &array)
    dfs(current + 1, end, sum, &array)
}

dfs(0, n/2, 0, &leftSums)
dfs(n/2, n, 0, &rightSums)

func upperbound(_ array: [Int], _ target: Int) -> Int {
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if array[mid] > target {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return start
}

leftSums.sort()

var answer = 0
for ele in rightSums {
    answer += upperbound(leftSums, c - ele)
}
print(answer)