import Foundation

func solution(_ ingredient:[Int]) -> Int {
    
    var ingredientArray = ingredient
    var count = 0
    var lastIndex = 0
    
    while ingredientArray.count > 0 {
        for i in lastIndex..<ingredientArray.count {
            // 햄버거 패턴의 길이는 4이므로, 현재 인덱스에서부터 3만큼 떨어진 인덱스가 배열 범위를 초과하는지 확인하면 된다.
            if i + 3 >= ingredientArray.count {
                return count
            }
            
            if (ingredientArray[i...(i+3)] == [1,2,3,1]){
                ingredientArray.removeSubrange(i...(i+3))
                // 앞에 3개가 같고 나머지 한개만 달라고 패턴과 일치하지 않으므로, 부분배열 제거 후 앞에 3개부터 일치하는지 다시 확인한다.
                lastIndex = i > 2 ? i - 3 : 0
                count+=1
                break
            }
        }
    }
    
    return count
}
