var map = [[String]]()
var mCount = 0
var nCount = 0

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var answer = 0
    mCount = m
    nCount = n
    for i in 0..<m {
        var row = Array(board[i]).map { String($0) }
        map.append(row)
    }
    
    while true {
        let toRemoves = checkWillRemoves()
        if toRemoves.isEmpty {
            break
        }
        
        for pos in toRemoves {
            map[pos[0]][pos[1]] = "@"
        }
        answer += toRemoves.count
        compress()
    }
    
    return answer
}

func compress() {
    for i in 0..<nCount {
        var col = [String]()
        for j in stride(from: mCount-1, through: 0, by: -1) {
            if map[j][i] != "@" {
                col.append(map[j][i])
            }
        }
        
        while col.count < mCount {
            col.append("@")
        }
        
        for j in 0..<mCount {
            map[mCount - j - 1][i] = col[j]
        }
    }
}

func checkWillRemoves() -> Set<[Int]> {
    var results = Set<[Int]>()
    
    for i in 0..<mCount-1 {
        for j in 0..<nCount-1 {
            let current = map[i][j]
            guard current != "@" else { continue }
            
            if current == map[i + 1][j] &&
              current == map[i][j + 1] &&
              current == map[i + 1][j + 1] {
                  results.insert([i, j])
                  results.insert([i + 1, j])
                  results.insert([i, j + 1])
                  results.insert([i + 1, j + 1])
              }
        }
    }
    
    return results
}

extension String {
    subscript(_ index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}