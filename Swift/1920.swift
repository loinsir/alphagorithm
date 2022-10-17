import Foundation

let N = Int(readLine()!)!
var arr1 = Set(readLine()!.components(separatedBy: " ").map { Int(String($0))! })
let M = Int(readLine()!)!
var arr2 = readLine()!.components(separatedBy: " ").map { Int(String($0))! }

for i in arr2 {
    if arr1.contains(i) {
        print(1)
    } else {
        print(0)
    }
}