import UIKit

func solution(_ seoul:[String]) -> String {
    var position: Int = 0
    
    for i in 0..<seoul.count {
        if seoul[i] == "Kim" {
            position = i
        }
    }
    return "김서방은 \(position)에 있다"
}

solution(["Jane", "Kim"])
