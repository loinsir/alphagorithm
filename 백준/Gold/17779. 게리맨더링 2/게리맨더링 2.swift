typealias Point = (r: Int, c: Int)
let n = Int(readLine()!)!
var map = [[Int]]()
for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func isInRange(_ p: Point, _ d1: Int, _ d2: Int) -> Bool {
    return (0..<n ~= p.c + d1 && 0..<n ~= p.r - d1) &&
    (0..<n ~= p.c + d2 && 0..<n ~= p.r + d2) &&
    (0..<n ~= p.c + d1 + d2 && 0..<n ~= p.r - d1 + d2) &&
    0..<n ~= p.r + d2 - d1
}

func minDiff(_ p: Point, _ d1: Int, _ d2: Int) -> Int {
    
    var population = [Int](repeating: 0, count: 5)
    
    for r in 0..<n {
        for c in 0..<n {
            if c <= p.c+d1, r < p.r, !(c > p.c && r >= p.r - (c-p.c)) {
                population[0] += map[r][c]
            } else if c > p.c+d1, r <= p.r-d1+d2, !(c <= p.c+d1+d2 && r >= p.r-d1 + (c-(p.c+d1))) {
                population[1] += map[r][c]
            } else if c < p.c+d2, r >= p.r, !(c >= p.c && r <= p.r + (c-p.c)) {
                population[2] += map[r][c]
            } else if c >= p.c+d2, r > p.r-d1+d2, !(c <= p.c+d1+d2 && r <= p.r-d1+d2 + ((p.c+d1+d2)-c)) {
                population[3] += map[r][c]
            } else {
                population[4] += map[r][c]
            }
        }
    }
    return population.max()! - population.min()!
}

var min = 40000

for r in 1..<n {
    for c in 0..<n-1 {
        for d1 in 1...r {
            for d2 in 1...n-r {
                guard isInRange((r, c), d1, d2) else { break }
                let m = minDiff((r, c), d1, d2)
                if min > m {
                    min = m
                }
            }
        }
    }
}

print(min)