// import Foundation

let input = Int(readLine()!)!

func fibo(index: Int) -> Int {
    var cache: [Int] = [0, 1]

    if index == 0 {
        return 0
    } else if index == 1 {
        return 1
    } else {
        for i in 2...index {
            cache.append(cache[i - 1] + cache[i - 2])
        }
        return cache[index]
    }
}

print(fibo(index: input))