import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (input[0], input[1])

var visited = Set<Int>()
var q = [[Int]]() // pos, time
q.append([n, 0])
visited.insert(n)
var idx = 0
var answer = 0

if n >= k {
    print(n-k)
} else {
    while idx < q.count {
        let cp = q[idx][0], time = q[idx][1]
    
        if cp == k {
            answer = time
            break
        }
        
        if 0...100000 ~= cp + 1 && !visited.contains(cp + 1) {
            q.append([cp + 1, time + 1])
            visited.insert(cp + 1)
        }
        
        if 0...100000 ~= 2 * cp && !visited.contains(2 * cp) {
            q.append([2 * cp, time + 1])
            visited.insert(2 * cp)
        }
        
        if 0...100000 ~= cp - 1 && !visited.contains(cp - 1) {
            q.append([cp-1, time + 1])
            visited.insert(cp-1)
        }
        
        idx += 1
    }
    print(answer)
}