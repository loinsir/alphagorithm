import Foundation

let n = Int(readLine()!)!
var combis = [[Int]]()
combination(targetArr: Array(0..<n), targetNum: 2, arr: [], index: 0)
print(combis.count)

func combination(targetArr: [Int], targetNum: Int, arr: [Int], index: Int) {
    if arr.count == targetNum {
        combis.append(arr)
        return
    }
    
    for i in index..<targetArr.count {
        if arr.isEmpty || arr.count > 0 && arr.last! < targetArr[index] {
            combination(targetArr: targetArr, targetNum: targetNum, arr: arr + [targetArr[index]], index: index + 1)
        }
    }
}