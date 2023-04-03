let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var nums = readLine()!.split(separator: " ").map { Int(String($0))! }

for _ in 0..<m {
    nums.sort(by: <)
    nums[0] = nums[0] + nums[1]
    nums[1] = nums[0]
}
print(nums.reduce(0, +))