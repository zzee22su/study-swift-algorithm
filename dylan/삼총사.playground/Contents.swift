import UIKit

func solution(_ number: Array<Int>) -> Int {
    var temp = Array(repeating: 0, count: 3)
    var count = 0
    
    func dfs(_ level: Int, _ index: Int) {
        if(level == 3) {
            let sum = temp.reduce(0) { partialResult, number in
                return partialResult + number
            }
            
            if(sum == 0) {
                count += 1
            }
            
        } else {
            for i in index..<number.count {
                temp[level] = number[i]
                dfs(level + 1, i + 1)
            }
        }
    }
    
    dfs(0, 0)
    
    return count
}

solution([-2, 3, 0, 2, -5])
