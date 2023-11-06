let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
var combis = [[Int]]()
combination(targetArr: Array(0..<n), targetNum: k, arr: [], index: 0)
print(combis.count)

func combination(targetArr: [Int], targetNum: Int, arr: [Int], index: Int) {
    if arr.count == targetNum {
        combis.append(arr)
        return
    }
    
    for i in index..<targetArr.count {
        if arr.isEmpty || arr.count > 0 && arr.last! < targetArr[i] {
            combination(targetArr: targetArr, targetNum: targetNum, arr: arr + [targetArr[i]], index: index + 1)
        }
    }
}