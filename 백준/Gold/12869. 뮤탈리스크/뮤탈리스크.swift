import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var answer = Int.max

var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 61, count: 61), count: 61), count: 61)

func attack(_ num1: Int, _ num2: Int, _ num3: Int, _ count: Int) {
    if num1 == 0 && num2 == 0 && num3 == 0 {
        answer = min(answer, count)
        return
    }

    if dp[max(num1-9, 0)][max(num2-3, 0)][max(num3-1, 0)] > count + 1 {
        dp[max(num1-9, 0)][max(num2-3, 0)][max(num3-1, 0)] = count + 1
        attack(max(num1-9, 0), max(num2-3, 0), max(num3-1, 0), count + 1)
    }

    if dp[max(num1-9, 0)][max(num2-1, 0)][max(num3-3, 0)] > count + 1 {
        dp[max(num1-9, 0)][max(num2-1, 0)][max(num3-3, 0)] = count + 1
        attack(max(num1 - 9, 0), max(num2 - 1, 0), max(num3 - 3, 0), count + 1)
    }

    if dp[max(num1-3, 0)][max(num2-1, 0)][max(num3-9, 0)] > count + 1 {
        dp[max(num1-3, 0)][max(num2-1, 0)][max(num3-9, 0)] = count + 1
        attack(max(num1 - 3, 0), max(num2 - 1, 0), max(num3 - 9, 0), count + 1)
    }

    if dp[max(num1-3, 0)][max(num2-9, 0)][max(num3-1, 0)] > count + 1 {
        dp[max(num1-3, 0)][max(num2-9, 0)][max(num3-1, 0)] = count + 1
        attack(max(num1 - 3, 0), max(num2 - 9, 0), max(num3 - 1, 0), count + 1)
    }

    if dp[max(num1-1, 0)][max(num2-3, 0)][max(num3-9, 0)] > count + 1 {
        dp[max(num1-1, 0)][max(num2-3, 0)][max(num3-9, 0)] = count + 1
        attack(max(num1 - 1, 0), max(num2 - 3, 0), max(num3 - 9, 0), count + 1)
    }

    if dp[max(num1-1, 0)][max(num2-9, 0)][max(num3-3, 0)] > count + 1 {
        dp[max(num1-1, 0)][max(num2-9, 0)][max(num3-3, 0)] = count + 1
        attack(max(num1 - 1, 0), max(num2 - 9, 0), max(num3 - 3, 0), count + 1)
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