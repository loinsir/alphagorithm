import Foundation

var heights: [Int] = []

for _ in 1...9 {
    let h = Int(readLine()!)!
    heights.append(h)
}

for i in 0...7 {
    for j in (i+1)...8 {
        
        var sum = 0
        for index in 0...8 {
            if index == i || index == j {
                continue
            }

            sum += heights[index]
        }

        if sum == 100 {
            let remove_num = [heights[i], heights[j]]
            heights.sort()
            for i in 0...8 {
                if heights[i] == remove_num[0] || heights[i] == remove_num[1] {
                    continue
                }
                print(heights[i])
            }
            exit(0)
        }
    }
}