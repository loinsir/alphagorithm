let t = Int(readLine()!)!
var arr = [Int]()

for _ in 1...t {
    arr = readLine()!.map { Int(String($0))! }
    if arr.count == 1 {
        print("YES")
    } else {
        print(check(0, arr.count-1) ? "YES" : "NO")
    }
}

func check(_ left: Int, _ right: Int) -> Bool {

    if left >= right {
        return true
    }

    var l = left, r = right
    while l < r {
        if arr[l] == arr[r] {
            return false
        }

        l += 1
        r -= 1
    }
    
    return check(left, r - 1)
}