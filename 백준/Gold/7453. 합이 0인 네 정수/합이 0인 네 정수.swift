import Foundation

let n = Int(readLine()!)!

var arr = [[Int]](repeating: [Int](), count: 4)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }

    for i in 0..<4 {
        arr[i].append(input[i])
    }
}

var answerSet = Set<[Int]>()
var lefts = [Int]()
var rights =  [Int]()

for i in 0..<n {
    for j in 0..<n {
        lefts.append(arr[0][i] + arr[1][j])
        rights.append(arr[2][i] + arr[3][j])
    }
}

lefts.sort()
rights.sort()

var start = 0, end = n * n - 1
var answer = 0

while start < n * n && end >= 0 {
    var increase = 0, decrease = 0

    if lefts[start] + rights[end] > 0 {
        end -= 1
    } else if lefts[start] + rights[end] < 0 {
        start += 1
    } else {
        let leftValue = lefts[start]
        let rightValue = rights[end]

        while start < n * n && lefts[start] == leftValue {
            start += 1
            increase += 1
        }

        while end >= 0 && rights[end] == rightValue {
            end -= 1
            decrease += 1
        }

        answer += increase * decrease
    }
}

print(answer)