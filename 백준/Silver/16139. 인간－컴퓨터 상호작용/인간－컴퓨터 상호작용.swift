import Foundation
var arr = Array(String(readLine()!))
var q = Int(String(readLine()!))!
var dict = [String: [Int]]()
for i in Character("a").asciiValue!...Character("z").asciiValue!{
    var preFix = Array(repeating: 0, count: arr.count)
    if Character(String(arr[0])).asciiValue! == i {
        preFix[0] = 1
    }
    for j in 1..<arr.count{
        if Character(String(arr[j])).asciiValue! == i {
            preFix[j] += (1 + preFix[j - 1])
        }else{
            preFix[j] = preFix[j - 1]
        }
    }
//    print(String(UnicodeScalar(i)))
    dict[String(UnicodeScalar(i))] = preFix
}
var str = ""
for _ in 0..<q{
    let alr = readLine()!.split(separator: " ").map{String($0)}
    let a = alr[0]
    let l = Int(alr[1])!
    let r = Int(alr[2])!

    let temp = dict[a]!
    if l == 0{
        str += "\(temp[r])\n"
    }else{
        str += "\(temp[r] - temp[l - 1])\n"
    }
}
print(str)