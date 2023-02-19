import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    let jobCount = jobs.count
    var jobs = jobs
    jobs.sort(by: { $0[1] < $1[1] }) // 소요시간으로 정렬
    jobs.sort(by: { $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1]}) // 소요시간 같으면 요청시간으로 정렬
    
    var time = 0
    var total = 0
    
    while jobs.count > 0 {
        for i in 0..<jobs.count {
            if jobs[i][0] <= time {
                time += jobs[i][1]
                total += time - jobs[i][0]
                jobs.remove(at: i)
                break
            }
            
            if i == jobs.count - 1 {
                time += 1
            }
        }
    }
    
    return total/jobCount
}