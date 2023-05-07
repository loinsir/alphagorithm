import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var board = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(row)
}

let one = [[1, 1, 1, 1]]
let two = [[1, 1], [1, 1]]
let three = [[1, 0], [1, 0], [1, 1]]
let four = [[1, 0], [1, 1], [0, 1]]
let five = [[1, 1, 1], [0, 1, 0]]

let blocks = [one, two, three, four, five]
var answer = 0

func rotate(_ block: [[Int]]) -> [[Int]] {
    let width = block.count
    let height = block[0].count
    var rotated = Array(repeating: Array(repeating: 0, count: width), count: height)
    
    for i in 0..<height {
        for j in 0..<width {
            rotated[i][j] = block[width - j - 1][i]
        }
    }
    
    return rotated
}

func flip(_ block: [[Int]]) -> [[Int]] {
    var flipped = Array(repeating: Array(repeating: 0, count: block[0].count), count: block.count)
    
    for i in 0..<block.count {
        for j in 0..<block[0].count {
            flipped[i][j] = block[i][block[0].count - j - 1]
        }
    }
    return flipped
}

func canPutDown(_ block: [[Int]], _ x: Int, _ y: Int) -> Bool {
    return x + block[0].count <= board[0].count && y + block.count <= board.count
}

func put(_ block: [[Int]], _ x: Int, _ y: Int) {
    var total = 0
    
    for i in 0..<block.count {
        for j in 0..<block[0].count {
            if block[i][j] == 1 {
                total += board[y + i][x + j]
            }
        }
    }
    answer = max(answer, total)
}

for i in 0..<5 {
    var block = blocks[i]
    
    for j in 0..<4 {
        
        var dir = j
        while dir > 0 {
            block = rotate(block)
            dir -= 1
        }
        
        let flipped = flip(block)
        
        for y in 0..<n {
            for x in 0..<m {
                if canPutDown(block, x, y) {
                    put(block, x, y)
                }
                
                if canPutDown(flipped, x, y) {
                    put(flipped, x, y)
                }
            }
        }
    }
}

print(answer)