import Foundation

let N = Int(readLine()!)!

var resultM1 = 0
var result0 = 0
var result1 = 0

var map: [[Int]] = []

for _ in 1...N {
    let temp = readLine()!.split(separator: " ").map{
        Int(String($0))!
    }
    map.append(temp)
}

func devide_and_conquer(_ y: Int, _ x: Int, _ size: Int) {
    let number = map[y][x]

    if size == 1 {
        if number == -1 {
            resultM1 += 1
        } else if number == 0 {
            result0 += 1
        } else if number == 1 {
            result1 += 1
        }
        return
    }

    for j in y..<y+size {
        for i in x..<x+size {
            if number != map[j][i] {
                devide_and_conquer(y, x, size/3)
                devide_and_conquer(y+size/3, x, size/3)
                devide_and_conquer(y+size/3*2, x, size/3)
                devide_and_conquer(y, x+size/3, size/3)
                devide_and_conquer(y, x+size/3*2, size/3)
                devide_and_conquer(y+size/3, x+size/3, size/3)
                devide_and_conquer(y+size/3*2, x+size/3, size/3)
                devide_and_conquer(y+size/3, x+size/3*2, size/3)
                devide_and_conquer(y+size/3*2, x+size/3*2, size/3)
                return
            }
        }
    }

    if number == -1 {
        resultM1 += 1
    } else if number == 0 {
        result0 += 1
    } else if number == 1 {
        result1 += 1
    }
}

devide_and_conquer(0,0, N)
print(resultM1)
print(result0)
print(result1)