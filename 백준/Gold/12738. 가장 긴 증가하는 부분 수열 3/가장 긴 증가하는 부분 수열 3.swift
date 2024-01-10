import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Double(String($0))! }
var res = [arr[0]]

for i in 0..<n {

    if res.last! == arr[i] { continue }
    else if res.last! < arr[i] {
        res.append(arr[i])
    } else {
        var start = 0, end = res.count
        while start < end {
            let mid = (start + end) / 2
            
            if res[mid] < arr[i] {
                start = mid + 1
            } else {
                end = mid
            }
        }
        
        res[end] = arr[i]
    }
}

print(res.count)