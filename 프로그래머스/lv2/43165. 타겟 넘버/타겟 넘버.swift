import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var answer = 0
    
    func dfs(_ number: Int, _ depth: Int) {
        if depth == numbers.count-1 {
            if number == target {
                answer += 1
            }
            return
        }
        
        dfs(number+numbers[depth+1], depth+1)
        dfs(number-numbers[depth+1], depth+1)
    }
    
    dfs(numbers.first!, 0)
    dfs(-numbers.first!, 0)
    
    return answer
}