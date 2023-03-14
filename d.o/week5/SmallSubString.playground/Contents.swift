import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var answer = 0
    let length = p.count
    var tString = t
    
    while tString.count != length - 1 {
        let number = tString.prefix(length)
        if Int(number)! <= Int(p)! { answer += 1}
        tString.removeFirst()
    }
    return answer
}
