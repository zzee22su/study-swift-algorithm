import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    // 실행 횟수
    var count = 0
    
    // 찾고자 하는 아이템의 현재 인덱스값
    var targetItemIdx = location
    
    var priorityArray = Array(priorities)
    
    while (true) {
        if priorityArray.isEmpty {
            break
        }
        
        var max = priorityArray.max()!
        var first = priorityArray.first!
        
        // 가장 우선순위가 높은 것부터 꺼낸다.
        if first != max {
            priorityArray.append(first)
        } else {
            // 첫번째에 있는 아이템이 가장 우선순위가 높으면 실행시킨다.
            count += 1
            
            // 가장 우선순위가 높은 값이면서 현재 아이템이 가장 첫번째에 위치한다면, 그것이 답이다.
            if targetItemIdx == 0 {
                return count
            }
        }
        
        priorityArray.removeFirst()
        targetItemIdx = targetItemIdx > 0 ? targetItemIdx - 1 : priorityArray.count - 1
    }
    
    return count
}
