import Foundation

func solution(_ n:Int) -> Int
{
    let oneCount = String(n, radix: 2).filter { $0 == "1" }.count
    var answer = n + 1
    while true {

        if String(answer, radix: 2).filter { $0 == "1" }.count == oneCount {
            break
        }
        answer += 1
    }

    return answer
}