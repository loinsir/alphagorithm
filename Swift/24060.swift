let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], K = input[1]
let A = readLine()!.split(separator: " ").map { Int(String($0))! }
var answers: [Int] = []

func mergeSort(_ arr: [Int]) -> [Int] {
    if arr.count <= 1 {
        return arr
    }

    let center = (arr.count+1) / 2 // 핵심
    let left = Array(arr[0..<center])
    let right = Array(arr[center..<arr.count])

    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var leftIdx = 0
        var rightIdx = 0
        var result: [Int] = []

        while leftIdx < left.count && rightIdx < right.count {
            if left[leftIdx] <= right[rightIdx] {
                result.append(left[leftIdx])
                answers.append(left[leftIdx])
                leftIdx += 1
            } else {
                result.append(right[rightIdx])
                answers.append(right[rightIdx])
                rightIdx += 1
            }
        }

        while leftIdx < left.count {
            result.append(left[leftIdx])
            answers.append(left[leftIdx])
            leftIdx += 1
        }

        while rightIdx < right.count {
            result.append(right[rightIdx])
            answers.append(right[rightIdx])
            rightIdx += 1
        }

        return result
    }

    return merge(mergeSort(left), mergeSort(right))
}

mergeSort(A)

if answers.count < K {
    print(-1)
} else {
    print(answers[K-1])
}