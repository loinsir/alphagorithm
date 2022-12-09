import Foundation

let N = Int(readLine()!)!
let As = readLine()!.split(separator: " ").map { Int(String($0))! }
let counts = readLine()!.split(separator: " ").map { Int(String($0))! }
var sum = Array(repeating: 0, count: 4)

var maxResult = Int.min
var minResult = Int.max

func dfs(_ order: [Int], _ value: Int) {
    if order.count == N {
        return
    }

    for i in 0...3 {
        var order = order
        var value = value

        if sum[i] + 1 <= counts[i] {
            if i == 0 {
                value += As[order.count+1]
            } else if i == 1 {
                value -= As[order.count+1]
            } else if i == 2 {
                value *= As[order.count+1]
            } else if i == 3 {
                if value < 0 {
                    value = -((-value) / As[order.count+1])
                }else {
                    value /= As[order.count+1]
                }
            }

            sum[i] += 1
            order.append(i)

            if order.count == N - 1 {
                if value > maxResult {
                    maxResult = value
                }

                if value < minResult {
                    minResult = value
                }
            }

            dfs(order, value)
            sum[i] -= 1
        }
    }
}

dfs([Int](), As[0])

print(maxResult)
print(minResult)