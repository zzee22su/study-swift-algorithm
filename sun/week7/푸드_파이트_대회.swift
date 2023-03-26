import Foundation

func solution(_ food:[Int]) -> String {
    
    var result = [Int]()
    var order = 1
    for i in 1..<food.count {
        // 음식이 한개일 때는 버려야 한다.
        if food[i] == 1 {
            order += 1
            continue
        }
        
        // 짝수일 때는 해당 음식 개수의 절반만큼만 더하면 된다.
        if food[i] % 2 == 0 {
            for _ in 1...(food[i] / 2) {
                result.append(order)
            }
            order+=1
            continue
        }
        // 홀수일 때는 한개는 버려야 하므로 -1을 한다.
        else {
            for _ in 1...((food[i] - 1) / 2) {
                result.append(order)
            }
            order+=1
            continue
        }
    }
    
    let reversed = result.reversed()
    result.append(0)
    result.append(contentsOf:reversed)
    
    return result.map{String($0)}.joined()
}

