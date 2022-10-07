import Foundation

let N = Int(readLine()!)!
var paper: [[Int]] = []
var resultW: Int = 0
var resultB: Int = 0

for _ in 1...N {
    let row = readLine()!.components(separatedBy: " ").map { Int($0)! }
    paper.append(row)
}

func devide_and_conquer(_ startY: Int, _ startX: Int, _ size: Int) {
    if isAllSameNum(startY, startX, size) {
        return
    } else {
        devide_and_conquer(startY, startX, size/2)
        devide_and_conquer(startY + size/2, startX, size/2)
        devide_and_conquer(startY, startX + size/2, size/2)
        devide_and_conquer(startY + size/2, startX + size/2, size/2)
    }
}

func isAllSameNum(_ startY: Int,_ startX: Int,_ size: Int) -> Bool {
    let number = paper[startY][startX]

    for i in stride(from: startY, to: startY+size, by: 1) {
        for j in stride(from: startX, to: startX+size, by: 1) {
            if paper[i][j] != number {
                return false
            }
        }
    }
    if number == 0 {
        resultW += 1
    } else if number == 1 {
        resultB += 1
    }
    return true
}
devide_and_conquer(0, 0, N)
print(resultW)
print(resultB)