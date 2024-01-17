import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

let order = [9, 3, 1]
var answer = Int.max

var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 61, count: 61), count: 61), count: 61)

func attack(_ num1: Int, _ num2: Int, _ num3: Int, _ count: Int) {
    if num1 == 0 && num2 == 0 && num3 == 0 {
        answer = min(answer, count)
        return
    }

    for i in 0..<3 {
        for j in 0..<3 where j != i {
            for k in 0..<3 where k != i && k != j {
                let nNum1 = max(num1 - order[i], 0)
                let nNum2 = max(num2 - order[j], 0)
                let nNum3 = max(num3 - order[k], 0)
                if dp[nNum1][nNum2][nNum3] > count + 1 {
                    dp[nNum1][nNum2][nNum3] = count + 1
                    attack(nNum1, nNum2, nNum3, count + 1)
                }
            }
        }
    }
}

if n == 1 {
    attack(arr[0], 0, 0, 0)
} else if n == 2 {
    attack(arr[0], arr[1], 0, 0)
} else {
    attack(arr[0], arr[1], arr[2], 0)
}
print(answer)