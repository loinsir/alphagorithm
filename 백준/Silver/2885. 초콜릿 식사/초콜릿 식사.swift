import Foundation

let k = Int(readLine()!)!
var size = 1

while size < k {
    size = size * 2
}

var answerSize = size

if size == k {
    print(answerSize, 0)
} else {
    var make = 0
    var count = 0
    
    while make < k {
        count += 1
        if size > k - make {
            size /= 2
            if size <= k - make {
                make += size
            }
        } else {
            make += size
        }
    }

    print(answerSize, count)
}