let M = Int(readLine()!)!
let N = Int(readLine()!)!

var sum = 0
var isPrimeNumber = true
var allPrimeNumber = false
var primes: [Int] = []

for i in M...N {
    if i == 1 {
        isPrimeNumber = false
    } else {
        for j in 2..<i {
            if i % j == 0 {
                isPrimeNumber = false
            }
        }

        if isPrimeNumber == true {
            primes.append(i)
            allPrimeNumber = true
        }
    }
    isPrimeNumber = true
}

if allPrimeNumber {
    sum = primes.reduce(0){$0+$1}
    print(sum)
    print(primes.min()!)
} else {
    print(-1)
}