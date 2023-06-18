import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    var arr = Array(readLine()!).map { Int(String($0))! }
    let chr = Array(readLine()!).map { String($0) }
    
    var answer = 0
    
    let dir = [-1, 0, 1]
    for i in 0..<n {
        if i == 0 {
            if arr[0] != 0 && arr[1] != 0 {
                arr[0] -= 1
                arr[1] -= 1
                answer += 1
            }
        } else if i == n - 1 {
            if arr[i] != 0 && arr[i - 1] != 0 {
                arr[i-1] -= 1
                arr[i-2] -= 1
                answer += 1
            }
        } else {
            if arr[i - 1] != 0 && arr[i] != 0 && arr[i + 1] != 0 {
                arr[i - 1] -= 1
                arr[i] -= 1
                arr[i + 1] -= 1
                answer += 1
            }
        }
    }
    print(answer)
}