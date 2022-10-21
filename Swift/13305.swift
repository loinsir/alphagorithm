let N = Int(readLine()!)!
let meters = readLine()!.split(separator: " ").map { Int(String($0))! }
let prices = readLine()!.split(separator: " ").map { Int(String($0))! }

var minPrice = Int.max
var result = 0
for meter in meters.enumerated() {
    if prices[meter.0] < minPrice {
        minPrice = prices[meter.0]
    }
    result += meter.1 * minPrice
}

print(result)