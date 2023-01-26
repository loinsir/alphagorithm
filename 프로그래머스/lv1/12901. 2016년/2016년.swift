import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    let targetDate = DateComponents(calendar: Calendar(identifier: .gregorian), year: 2016, month: a, day: b).date!
    
    let day = Calendar.current.component(.weekday, from: targetDate) - 1
    
    return Calendar.current.shortWeekdaySymbols[day].uppercased()
}