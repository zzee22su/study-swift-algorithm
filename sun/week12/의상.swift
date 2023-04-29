import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var clothTypeMap = [String:[String]]()
    
    for cloth in clothes {
        let clothName = cloth[0]
        let clothType = cloth[1]
        
        guard let _ = clothTypeMap[clothType] else {
            clothTypeMap[clothType] = [String]()
            clothTypeMap[clothType]?.append(clothName)
            
            continue
        }
        
        clothTypeMap[clothType]?.append(clothName)
    }
    
    var result = 1
    for cloth in clothTypeMap.values {
        // +1: 안입는 경우도 포함
        result *= (cloth.count + 1)
    }
    
    // 모두 안입는 경우는 없으므로 빼준다.
    result -= 1
    
    return result
}

