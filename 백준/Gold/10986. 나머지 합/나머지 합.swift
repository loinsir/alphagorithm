import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0], m = nm[1]
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var preFix = [Int](repeating: 0, count: arr.count)
var count = [Int](repeating: 0, count: m)
for i in 0..<arr.count {
    if i == 0 {
        preFix[i] = arr[i]
    } else {
        preFix[i] = arr[i] + preFix[i - 1]
    }
    count[preFix[i] % m] += 1 // 해당 구간까지의 합이 m으로 나뉘는 갯수를 카운팅
}

var result = 0
for i in 0..<m {
    result += (count[i] * (count[i] - 1)) / 2 // nC2를 계산해서, 조합의 개수를 구한다.
}
print(result + count[0])
