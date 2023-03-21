import Foundation

func solution(_ num:Int) -> Int {
    if num == 1 {
        return 0
    }
    
    var input = num
    
    var count = 0
    while (true) {
        if count == 500 {
            break
        }
        
        let isEvenNum = input % 2 == 0
        
        if isEvenNum {
            input /= 2
        } else {
            input = input * 3 + 1
        }
        
        count += 1
        
        if input == 1 {
            return count
        }
    }
    
    return -1
}

