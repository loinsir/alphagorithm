import Foundation

let T = Int(readLine()!)!

for _ in 1...T {
    let line = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
    let N = line[0] // 문서 개수
    let M = line[1] // 몇 번째 인쇄되었는지 궁금

    var queue = Array(readLine()!.components(separatedBy: " ").map { Int(String($0))! }.enumerated())
    var count = 0
    let target = queue[M].0

    while let first = queue.first {
        if queue[1...].allSatisfy { $0.1 <= first.1 } { // 인쇄 가능
            count += 1
            let printing = queue.removeFirst()
            if printing.0 == target {
                break
            }
        } else { // 뒤로 보내기
            queue.append(queue.removeFirst())
        }
    } 

    print(count)
}