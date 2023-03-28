import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = [String]()
    
    // 각 숫자별 좌표 배열
    let numberArr = [[0,0],[0,1],[0,2],
                     [1,0],[1,1],[1,2],
                     [2,0],[2,1],[2,2],
                     [3,0],[3,1],[3,2]]

    var left = 9 // 왼손 시작 좌표 인덱스
    var right = 11 // 오른손 시작 좌표 인덱스
    for num in numbers {
        // 1,4,7 일 때
        if num != 0 && num % 3 == 1 {
            result.append("L")
            left = num - 1
            continue
        }
        // 3,6,9 일 때
        else if num != 0 && num % 3 == 0 {
            result.append("R")
            right = num - 1
            continue
        }
        // 2,5,8,0 일 때. 0은 인덱스가 무조건 10이다.
        let index = num == 0 ? 10 : num - 1
        
        let leftDistance = abs(numberArr[left][0] - numberArr[index][0]) + abs(numberArr[left][1] - numberArr[index][1])
        let rightDistance = abs(numberArr[right][0] - numberArr[index][0]) + abs(numberArr[right][1] - numberArr[index][1])
        
        if leftDistance == rightDistance {
            if hand == "left" {
                result.append("L")
                left = index
            } else {
                result.append("R")
                right = index
            }
            continue
        } else if leftDistance > rightDistance {
            result.append("R")
            right = index
            continue
        } else {
            result.append("L")
            left = index
        }
    }
    
    return result.joined()
}

