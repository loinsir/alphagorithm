func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var map1Arr = arr1.map { String($0, radix: 2) }
    var map2Arr = arr2.map { String($0, radix: 2) }
    
    for i in 0..<n {
        while map1Arr[i].count < n {
            map1Arr[i] = "0" + map1Arr[i]
        }
        
        while map2Arr[i].count < n {
            map2Arr[i] = "0" + map2Arr[i]
        }
        
        var rowString = ""
        
        for j in 0..<n {
            if Array(map1Arr[i])[j] == "1" || Array(map2Arr[i])[j] == "1" {
                rowString += "#"
            } else {
                rowString += " "
            }
        }
        answer.append(rowString)
    }
    
    return answer
}