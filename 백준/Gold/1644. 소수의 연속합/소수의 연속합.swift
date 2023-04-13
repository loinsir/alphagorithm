let n = Int(readLine()!)!

if n == 1 {
    print(0)
} else if n == 2 {
    print(1)
} else {
    var arr = Array(repeating: 0, count: 4000001)
    for i in 2...n {
        arr[i] = i
    }
    for i in 2...n {
        if arr[i] == 0 { continue }
        for j in stride(from: i+i, through: n, by: i) {
            arr[j] = 0
        }
    }

    var start = 0, end = 0
    var answer = 0
    var sum = 0

    for start in 1...n {
        if arr[start] == 0 {
            continue
        }
        while sum < n && end <= n {
            if arr[end] != 0 {
                sum += end
            }
            end += 1
        }
        if sum == n {
            answer += 1
        }
        sum -= arr[start]
    }

    print(answer)
}
