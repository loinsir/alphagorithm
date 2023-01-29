func solution(_ dartResult:String) -> Int {
    var arr = Array(dartResult)
    
    var answer = 0
    var previous = 0
    var current = 0
    
    for i in 0..<arr.count {
        if arr[i].isNumber {
            if current == 0 {
                current = Int(String(arr[i]))!
            } else if current == 1 && arr[i] == "0" {
                current = 10
            }
        } else if arr[i] == "S" {
            if (i+1 < arr.count && arr[i+1].isNumber) || i+1 == arr.count {
                answer += current
                previous = current
                current = 0
            }
        } else if arr[i] == "D" {
            current = current * current
            if (i+1 < arr.count && arr[i+1].isNumber) || i+1 == arr.count {
                answer += current
                previous = current
                current = 0
            }
        } else if arr[i] == "T" {
            current = current * current * current
            if (i+1 < arr.count && arr[i+1].isNumber) || i+1 == arr.count {
                answer += current
                previous = current
                current = 0
            }
        } else if arr[i] == "*" {
            answer += previous
            current *= 2
            answer += current
            previous = current
            current = 0
        } else if arr[i] == "#" {
            answer -= current
            previous = -current
            current = 0
        }
    }
    
    return answer
}