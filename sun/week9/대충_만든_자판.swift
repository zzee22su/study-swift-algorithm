import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {

    // 각 알파벳 별로 최소 몇번을 눌러야하는지 기록하는 맵
    // Key: 알파벳, Value: 최소 횟수
    var countCachingMap = [Character:Int]()
    
    func findMinPushCount(target: Character) -> Int {
        countCachingMap[target] = 0
        
        for k in keymap {
            guard let idx = k.firstIndex(of: target) else {
                continue
            }
            
            let pushCount = k.distance(from: k.startIndex, to: idx) + 1
            // 누른 횟수가 1이면 최소이기 때문에 더 이상 검사할 필요가 없다.
            if pushCount == 1 {
                countCachingMap[target] = pushCount
                return 1
            }
            
            // 초기화
            if countCachingMap[target] == 0 {
                countCachingMap[target] = pushCount
                continue
            }
            
            // 기존 값과 새로 계산한 값을 비교해서 더 작은 것으로 바꿔준다.
            if countCachingMap[target]! > pushCount {
                countCachingMap[target] = pushCount
            }
        }
      
        return countCachingMap[target]!
    }
    
    var pushCountArr = [Int]()
    for target in targets {
        var pushCount = 0
        for t in target {
            guard let count = countCachingMap[t] else {
                let count = findMinPushCount(target: t)
                
                // count == 0이면 자판에서 문자를 찾지 못했다는 것으로, 문자열을 완성할 수 없다.
                if count == 0 {
                    pushCount = 0
                    break
                }
                
                countCachingMap[t] = count
                pushCount += count
                
                continue
            }
            
            // count == 0이면 자판에서 문자를 찾지 못했다는 것으로, 문자열을 완성할 수 없다.
            if count == 0 {
                pushCount = 0
                break
            }
            
            pushCount += count
        }
        
        pushCountArr.append(pushCount > 0 ? pushCount : -1)
    }
                                                
    return pushCountArr
}

solution(["ABACD", "BCEFD"], ["ABCD","AABB"]) // [9,4]

