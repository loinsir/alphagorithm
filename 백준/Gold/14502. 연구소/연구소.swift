import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var viruses = [[Int]]() // [y, x]
var emptySpaces = [[Int]]()
var map = [[Int]]()
var map2 = [[Int]]()

for i in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(row)
    map2.append(row)
    for j in 0..<m {
        if row[j] == 2 {
            viruses.append([i, j])
        } else if row[j] == 0 {
            emptySpaces.append([i, j])
        }
    }
}

let dy = [1, 0, -1, 0]
let dx = [0, -1, 0, 1]

func isAvail(_ y: Int, _ x: Int) -> Bool {
    return 0..<n ~= y && 0..<m ~= x
}

func bfs(_ y: Int, _ x: Int) {
    var q = [[Int]]()
    var idx = 0
    q.append([y, x])
    
    while idx < q.count {
        let yPos = q[idx][0], xPos = q[idx][1]
        
        for i in 0..<4 {
            let ny = yPos + dy[i], nx = xPos + dx[i]

            if isAvail(ny, nx) {
                if map2[ny][nx] == 0 {
                    map2[ny][nx] = 2
                    q.append([ny, nx])
                }
            }
        }
        idx += 1
    }
}

func calculateSafeArea() -> Int {
    var answer = 0
    for i in 0..<n {
        for j in 0..<m {
            if map2[i][j] == 0 {
                answer += 1
            }
        }
    }
    return answer
}

var combis = [[[Int]]]()

func combination(_ targetArr: [[Int]], _ targetNum: Int, _ arr: [[Int]], _ index: Int) {
    if arr.count == targetNum {
        combis.append(arr)
        return
    }
    
    for i in index..<targetArr.count {
        if arr.count > 0 && arr.last![0] > targetArr[i][0] { continue }
        if arr.count > 0 && arr.last![0] == targetArr[i][0] && arr.last![1] >= targetArr[i][1] { continue }  
 
        combination(targetArr, targetNum, arr + [targetArr[i]], index+1)
    }
}

combination(emptySpaces, 3, [], 0)

var answer = 0

for i in 0..<combis.count {
    let currentCombi = combis[i]
    
    for y in 0..<n {
        for x in 0..<m {
            map2[y][x] = map[y][x]
        }
    }
    
    for c in 0..<3 {
        map2[currentCombi[c][0]][currentCombi[c][1]] = 1
    }
    
    for c in 0..<viruses.count {
        let virusYPos = viruses[c][0], virusXPos = viruses[c][1]
        bfs(virusYPos, virusXPos)
    }
    
    answer = max(answer, calculateSafeArea())
}

print(answer)
