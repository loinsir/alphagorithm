import Foundation

var merged = [[(Int, Int)]]()
var content = [[String]]()

func update(_ r: Int, _ c: Int, _ value: String) {
    let pos = merged[r][c]
    content[pos.0][pos.1] = value
}

func update(_ value1: String, _ value2: String) {
    for i in 1...50 {
        for j in 1...50 {
            if content[i][j] == value1 {
                content[i][j] = value2
            }
        }
    }
}

func merge(_ r1: Int, _ c1: Int, _ r2: Int, _ c2: Int) {
    let one = merged[r1][c1]
    let two = merged[r2][c2]
    
    let oneContent = content[one.0][one.1]
    let twoContent = content[two.0][two.1]
    
    var value = oneContent
    if value == "EMPTY" {
        value = twoContent
    }
    
    for i in 1...50 {
        for j in 1...50 {
            if merged[i][j] == two {
                merged[i][j] = one
            }
        }
    }
    content[one.0][one.1] = value
}

func unmerge(_ r: Int, _ c: Int) {
    let pos = merged[r][c]
    let tmp = content[pos.0][pos.1]
    
    for i in 1...50 {
        for j in 1...50 {
            if merged[i][j] == pos {
                merged[i][j] = (i, j)
                content[i][j] = "EMPTY"
            }
        }
    }
    
    content[r][c] = tmp
}

func solution(_ commands:[String]) -> [String] {
    
    var answer = [String]()
    
    for i in 0...50 {
        var mergedRow = [(Int, Int)]()
        var contentRow = [String]()
        for j in 0...50 {
            mergedRow.append((i, j))
            contentRow.append("EMPTY")
        }
        merged.append(mergedRow)
        content.append(contentRow)
    }
    
    for command in commands {
        let com = command.split(separator: " ").map { String($0) }
        if com.count == 4 && com[0] == "UPDATE" {
            update(Int(com[1])!, Int(com[2])!, com[3])
        } else if com.count == 3 && com[0] == "UPDATE" {
            update(com[1], com[2])
        } else if com[0] == "MERGE" {
            merge(Int(com[1])!, Int(com[2])!, Int(com[3])!, Int(com[4])!)
        } else if com[0] == "UNMERGE" {
            unmerge(Int(com[1])!, Int(com[2])!)
        } else if com[0] == "PRINT" {
            let pos = merged[Int(com[1])!][Int(com[2])!]
            answer.append(content[pos.0][pos.1])
        }
    }
    
    return answer
}