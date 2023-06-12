import Foundation

var w = [[Int]]()

for i in 0..<4 {
    let input = Array(readLine()!).map { Int(String($0))! }
    w.append(input)
}

let k = Int(readLine()!)!
for i in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (num, dir) = (input[0], input[1])
    
    var clock = [Int]()
    var reverse = [Int]()
    
    if dir == 1 {
        clock.append(num - 1)
    } else {
        reverse.append(num - 1)
    }
    
    switch num {
        case 1:
        if w[0][2] != w[1][6] {
            if dir == 1 {
                reverse.append(1)
                
                if w[1][2] != w[2][6] {
                    clock.append(2)
                    
                    if w[2][2] != w[3][6] {
                        reverse.append(3)
                    }
                }
            } else {
                clock.append(1)
                
                if w[1][2] != w[2][6] {
                    reverse.append(2)
                    
                    if w[2][2] != w[3][6] {
                        clock.append(3)
                    }
                }
            }
        }
        case 2:
        if w[1][2] != w[2][6] {
            if dir == 1 {
                reverse.append(2)
                
                if w[2][2] != w[3][6] {
                    clock.append(3)
                }
            } else {
                clock.append(2)
                
                if w[2][2] != w[3][6] {
                    reverse.append(3)
                }
            }
        }
        
        if w[1][6] != w[0][2] {
            if dir == 1 {
                reverse.append(0)
            } else {
                clock.append(0)
            }
        }
        
        case 3:
        if w[2][2] != w[3][6] {
            if dir == 1 {
                reverse.append(3)
            } else {
                clock.append(3)
            }
        }
        
        if w[2][6] != w[1][2] {
            if dir == 1 {
                reverse.append(1)
                
                if w[1][6] != w[0][2] {
                    clock.append(0)
                }
            } else {
                clock.append(1)
                
                if w[1][6] != w[0][2] {
                    reverse.append(0)
                }
            }
        }
        
        case 4:
        if w[3][6] != w[2][2] {
            if dir == 1 {
                reverse.append(2)
                
                if w[2][6] != w[1][2] {
                    clock.append(1)
                    
                    if w[1][6] != w[0][2] {
                        reverse.append(0)
                    }
                }
            } else {
                clock.append(2)
                
                if w[2][6] != w[1][2] {
                    reverse.append(1)
                    
                    if w[1][6] != w[0][2] {
                        clock.append(0)
                    }
                }
            }
        }
        default: break
    }
    
    for wheel in clock {
        spinning(wheel, 1)
    }
    
    for wheel in reverse {
        spinning(wheel, -1)
    }
}

var answer = 0

for i in 0..<4 {
    if w[i][0] == 1 {
        answer += Int(pow(2.0, Double(i)))
    }
}

print(answer)

func spinning(_ wheelIdx: Int, _ dir: Int) {
    let wheel = w[wheelIdx]
    
    if dir > 0 {
        w[wheelIdx] = [wheel.last!] + Array(wheel[0..<wheel.count - 1]) 
    } else {
        w[wheelIdx] = Array(wheel[1..<wheel.count]) + [wheel[0]]
    }
}