while true {
    let input = readLine()!
    if input == "0" {
        break
    }

    var start = 0
    var end = input.count-1
    var flag = false
    while start < end {
        if input[input.index(input.startIndex, offsetBy: start)] == input[input.index(input.startIndex, offsetBy: end)] {
            start += 1
            end -= 1
        } else {
            print("no")
            flag = true
            break
        }
    }

    if !flag {
        print("yes")
    }
}