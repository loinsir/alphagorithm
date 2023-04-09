import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, C) = (input[0], input[1])

var arr = [Int]()
for _ in 0..<N {
    let pos = Int(readLine()!)!
    arr.append(pos)
}
arr.sort()

if C == 2 {
    print(arr.last! - arr.first!)
} else {
    
    var start = 1
    var end = arr.last! - arr.first!
    var result = 0
    
    while start <= end {
        var count = 1
        let mid = (start + end) / 2
        var prevHome = arr[0]
        
        for i in 1..<N {
            let currentHome = arr[i]
            if currentHome - prevHome >= mid {
                count += 1
                prevHome = currentHome
            }
        }
        
        if count < C {
            end = mid - 1
        } else {
            start = mid + 1
        }
        
    }
    print(start - 1)
}