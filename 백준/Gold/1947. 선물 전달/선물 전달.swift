import Foundation

let n = Int(readLine()!)!
var x = 0, y = 1, z = 0

if n == 1 {
    z = x
} else if n == 2 {
    z = y
} else {
    for i in 3...n {
        z = (i-1) * ((x + y) % 1000000000) % 1000000000
        x = y
        y = z
    }
}
print(z)