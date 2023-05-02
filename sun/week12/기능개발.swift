import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {

    var remainDays = [Int]()
    
    for i in 0..<progresses.count {
        var remainDay = (100 - progresses[i]) / speeds[i]
        var remainHour = Double((100 - progresses[i]) % speeds[i])
        
        remainDays.append(remainHour > 0 ? remainDay + 1 : remainDay)
    }
    
    var releaseCount = [Int]()
    
    var count = 0
    var max = remainDays.first!
    for remainDay in remainDays {
        
        if max < remainDay {
            releaseCount.append(count)
            count = 0
            max = remainDay
        }
        
        count += 1
    }
    
    if count > 0 {
        releaseCount.append(count)
    }
    
    return releaseCount
}
