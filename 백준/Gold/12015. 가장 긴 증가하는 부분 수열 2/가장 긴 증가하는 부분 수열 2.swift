import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var x = [Int]()

for i in 0..<arr.count {
    if x.isEmpty {
        x.append(arr[i])
    } else if x.last! < arr[i] {
        x.append(arr[i])
    } else {
        var l = 0, r = x.count - 1
        while l < r {
            let mid = (l + r) / 2
            
            if x[mid] >= arr[i] {
                r = mid
            } else {
                l = mid + 1
            }
        }
        x[l] = arr[i]
    }
}
print(x.count)