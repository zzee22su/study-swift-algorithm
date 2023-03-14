import Foundation

func solution(_ number:[Int]) -> Int {
    var answer = 0
    let length = number.count
    
    for i in 0..<length-2 {
        for j in i+1..<length-1 {
            for k in j+1..<length {
                if number[i] + number[j] + number[k] == 0 { answer += 1}
            }
        }
    }
    
    return answer
}
