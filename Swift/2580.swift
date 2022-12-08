import Foundation
var boards: [[Int]] = Array(repeating: [], count: 9)
var blankMap: [[Int]] = []

for i in 0...8 {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    boards[i].append(contentsOf: input)
}

for y in 0...8 {
    for x in 0...8 {
        if boards[y][x] == 0 {
            blankMap.append([y, x])
        }
    }
}

func isPromising(_ num: Int , _ y: Int, _ x: Int) -> Bool {
    // 가로, 세로줄 체크
    for i in 0...8 {
        if boards[i][x] == num || boards[y][i] == num {
            return false
        }
    }

    // 정사각형 체크
    var xInitial = x / 3 * 3 
    var yInitial = y / 3 * 3

    for ydx in yInitial...yInitial+2 {
        for xdx in xInitial...xInitial+2 {
            if boards[ydx][xdx] == num {
                return false
            }
        }
    }
    
    return true
}
var flag = false
func dfs(_ y: Int, _ x: Int, _ blankIndex: Int) {
    if blankIndex == blankMap.count {
        for i in boards {
            print(i.map{String($0)}.joined(separator: " "))
        }
        flag = true
        return
    }

    let row = blankMap[blankIndex][0]
    let col = blankMap[blankIndex][1]

    for i in 1...9 {
        if isPromising(i, row, col) {
            boards[row][col] = i
            dfs(row, col, blankIndex + 1)
        }
        if flag {
            return
        }
    }
    boards[row][col] = 0
}

dfs(blankMap[0][0], blankMap[0][1], 0)