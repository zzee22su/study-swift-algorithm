import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var paintingCount = 0
    var lastIdx = 1 // 헷갈리니깐 1부터 시작하자
    for sectionIdx in section {
        
        if lastIdx > sectionIdx {
            continue
        }
        
        lastIdx = sectionIdx + m
        
        paintingCount += 1
        
        if lastIdx > n {
            break
        }
        
    }
    
    return paintingCount
}
