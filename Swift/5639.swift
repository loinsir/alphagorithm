var preOrder = [Int]()

while let input = readLine(), let n = Int(input) {
    preOrder.append(n)
}

func binarySearch(_ low: Int, _ high: Int, _ target: Int) -> Int {
    var low = low, high = high

    while low < high {
        let mid = (low + high) / 2
        if target < preOrder[mid] {
            high = mid
        } else {
            low = mid + 1
        }
    }
    return low
}

func postOrder(_ start: Int, _ end: Int) {
    if start >= end { return }
    let selectedIndex = binarySearch(start+1, end, preOrder[start])
    postOrder(start+1, selectedIndex)
    postOrder(selectedIndex, end)
    print(preOrder[start])
}

postOrder(0, preOrder.count)

// 다시 풀어보기