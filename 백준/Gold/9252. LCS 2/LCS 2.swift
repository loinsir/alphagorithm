import Foundation

let arr1 = readLine()!.map { String($0) }
let arr2 = readLine()!.map { String($0) }

var s = [[Int]](repeating: [Int](repeating: 0, count: 1001), count: 1001)
var lcs = ""
for i in 0..<arr1.count {
    for j in 0..<arr2.count {
        if arr1[i] == arr2[j] {
            s[i + 1][j + 1] = s[i][j] + 1 
        } else {
            s[i + 1][j + 1] = max(s[i][j + 1], s[i + 1][j])
        }
    }
}

print(s[arr1.count][arr2.count])
prints(arr1.count, arr2.count)
print(lcs)
func prints(_ i: Int, _ j: Int) {
    if s[i][j] == 0 { return }
    if arr1[i-1] == arr2[j-1] {
        prints(i-1, j-1)
        lcs += arr1[i-1]
    } else if s[i-1][j] > s[i][j-1] {
        prints(i-1, j)
    } else {
        prints(i, j-1)
    }
}