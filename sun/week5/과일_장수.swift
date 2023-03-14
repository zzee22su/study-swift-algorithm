import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    
    if score.count < m {
        return 0
    }
  
    // 팔 수 있는 최대 박스의 개수
    var maxBoxCount = score.count / m
    
    // 내림차순으로 정렬
    var sortedScore = score.sorted(by: >)
    
    // m개씩 자르기
    var splittedScores = sortedScore.chunked(into: m)
    
    // 최대 이익 계산하기
    var totalPrice = 0
    for i in 0..<maxBoxCount {
        totalPrice += splittedScores[i].min()! * m
    }
    
    return totalPrice
}

extension Array {
 
     public func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
     }
 }


