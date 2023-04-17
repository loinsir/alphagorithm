
func combination(_ targetArr: [Int], _ targetNum: Int, _ arr: [Int], _ index: Int) {
    if arr.count == targetNum {
        if arr.reduce(0, +) == 100 {
            for i in 0..<7 {
                print(arr[i])
            }
        }
        return
    }
    
    for i in index..<targetArr.count {
        combination(targetArr, targetNum, arr + [targetArr[i]], i+1)
    }
}

var arr = [Int]()
for _ in 0..<9 {
    arr.append(Int(readLine()!)!)
}

_ = combination(arr, 7, [], 0)