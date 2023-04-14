import Foundation

func solution(_ s: Int) -> Int {
    
    var pushCount = 0
    
    var floor = s
    while floor > 0 {
        let remainder = floor % 10
        pushCount += remainder > 5 ? 10 - remainder : remainder
        
        if floor % 100 > 50 {
            floor += remainder > 5 ? 10 - remainder : remainder * 1
        } else {
            floor += remainder > 5 ? 10 - remainder : remainder * -1
        }
        
        floor /= 10
    }
    
    return pushCount
}
