import Foundation

let line = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let A = line[0]
let B = line[1]
let C = line[2]

func devide_and_conquer(_ number: Int) -> Int {
    if number == 0 {
        return 1
    } 

    if number % 2 == 0 {
        let ret = devide_and_conquer(number / 2)
        return ret % C * ret % C
    } else {
        let ret = devide_and_conquer((number-1) / 2)
        return ret % C * ret % C * A % C
    }
}
print(devide_and_conquer(B))