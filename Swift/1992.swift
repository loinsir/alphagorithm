import Foundation

let N = Int(readLine()!)!
var map: [[Int]] = []

for _ in 1...N {
    var array: [Int] = []
    for char in readLine()! {
        array.append(Int(String(char))!)
    }
    map.append(array)
}

var result = ""

func devide_and_conquer(_ startY: Int, _ startX: Int, _ size: Int) -> String {
    if let sameNumber = getSameNumber(startY, startX, size) {
        return String(sameNumber)
    } else {
        var leftTop = devide_and_conquer(startY, startX, size/2)
        var leftBottom = devide_and_conquer(startY+size/2, startX, size/2)
        var rightTop = devide_and_conquer(startY, startX+size/2, size/2)
        var rightBottom = devide_and_conquer(startY+size/2, startX+size/2, size/2)
        return "(\(leftTop)\(rightTop)\(leftBottom)\(rightBottom))"
    }
}

func getSameNumber(_ startY: Int, _ startX: Int, _ size: Int) -> Int? {
    let number = map[startY][startX]
    for j in startY..<startY+size {
        for i in startX..<startX+size {
            if number != map[j][i] {
                return nil
            }
        }
    }

    return number
}

print(devide_and_conquer(0, 0, N))