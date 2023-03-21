import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var result = [Int]()
    
    for i in 0..<score.count {
        let range = Array(score[0...i]).sorted(by: >)
        
        if range.count <= k {
            result.append(range.min()!)
        }
        else {
            result.append(range[0..<k].min()!)
        }
    }
    
    return result
}

