import Foundation

func solution(_ nums:[Int]) -> Int {
    
    var combinations: [[Int]] = []
    
    func combination(_ targetArr: [Int], _ targetNum: Int, _ index: Int, _ arr: [Int]) {
      if arr.count == targetNum {
        combinations.append(arr)
        return
      }

      for i in index..<targetArr.count {
        combination(targetArr, targetNum, i+1, arr + [targetArr[i]])
      }
    }
    
    func isPrime(num: Int) -> Bool {
        if (num < 4) {
            return num == 1 ? false : true
        }
        for i in 2...Int(sqrt(Double(num))) {
            if (num % i == 0) { return false }
        }
        return true
    }
    
    combination(nums, 3, 0, [])
    var answer = 0
    for arr in combinations {
        var sum = arr.reduce(0) { $0 + $1 }
        if isPrime(num: sum) {
            answer += 1
        }
    }

    return answer
}