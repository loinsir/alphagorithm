let N = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
var answer = 0

if N < 3 {
    print(0)
} else {
    for i in 0..<N {
        let target = arr[i]
        
        var start = 0
        if i == start {
            start += 1
        }
        var end = N - 1
        if i == end {
            end -= 1
        }
        
        while start < end {
            let sum = arr[start] + arr[end]
            
            if sum == target {
                answer += 1
                break
            } else if sum > target {
                end -= 1
                if end == i {
                    end -= 1
                }
            } else if sum < target {
                start += 1
                if start == i {
                    start += 1
                }
            }
        }
    }

    print(answer)
}