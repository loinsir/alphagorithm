import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var lis = [arr[0]]

for i in 0..<n {

    if lis.last! < arr[i] {
        lis.append(arr[i])
    } else {
        var start = 0, end = lis.count
    
        while start < end {
            let mid = (start + end) / 2
            
            if lis[mid] < arr[i] {
                start = mid + 1
            } else {
                end = mid
            }
        }

        lis[end] = arr[i]
    }
}

print(n - lis.count)