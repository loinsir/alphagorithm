import Foundation

let N = Int(readLine()!)!
var line = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
line.sort(by: <)

var i = 0
var j = N - 1

var answerI = 0
var answerJ = N - 1

var distance = 2000000000

while i < j {
    let tempSum = line[i] + line[j]
    if abs(tempSum) < distance {
        distance = abs(tempSum)
        answerI = i
        answerJ = j
        if tempSum == 0 {
            break
        }
    }

    if tempSum < 0 {
        i += 1
    } else {
        j -= 1
    }
}
print(line[answerI], line[answerJ])