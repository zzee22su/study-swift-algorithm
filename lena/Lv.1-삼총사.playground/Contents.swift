import UIKit

/*: Lv.1 - 삼총사 (https://school.programmers.co.kr/learn/courses/30/lessons/131705)
 > 한국중학교에 다니는 학생들은 각자 정수 번호를 갖고 있습니다. 이 학교 학생 3명의 정수 번호를 더했을 때 0이 되면 3명의 학생은 삼총사라고 합니다. 예를 들어, 5명의 학생이 있고, 각각의 정수 번호가 순서대로 -2, 3, 0, 2, -5일 때, 첫 번째, 세 번째, 네 번째 학생의 정수 번호를 더하면 0이므로 세 학생은 삼총사입니다. 또한, 두 번째, 네 번째, 다섯 번째 학생의 정수 번호를 더해도 0이므로 세 학생도 삼총사입니다. 따라서 이 경우 한국중학교에서는 두 가지 방법으로 삼총사를 만들 수 있습니다.한국중학교 학생들의 번호를 나타내는 정수 배열 number가 매개변수로 주어질 때, 학생들 중 삼총사를 만들 수 있는 방법의 수를 return 하도록 solution 함수를 완성하세요.
 - 제한사항
     - 3 ≤ number의 길이 ≤ 13
     - -1,000 ≤ number의 각 원소 ≤ 1,000
     - 서로 다른 학생의 정수 번호가 같을 수 있습니다.
 */

//재귀함수를 사용한 조합을 구하는 함수
func combination(_ arr: [Int], _ selected: [Int], _ index: Int, _ count: Int, _ handler: ([Int]) -> Void) {
    if count == 0 {
        handler(selected)
        return
    }
    // 배열의 마지막까지 탐색한 경우
    if index == arr.count {
        return
    }
    
    // 새로운 선택 배열을 만들어 현재 인덱스의 값을 추가.
    var newSelected = selected
    newSelected.append(arr[index])
    
    // 현재 인덱스의 값을 선택하는 경우와 선택하지 않는 경우 모두를 재귀 호출.
    combination(arr, newSelected, index+1, count-1, handler) // 선택한 경우
    combination(arr, selected, index+1, count, handler) // 선택하지 않은 경우
}

func solution(_ number: [Int]) -> Int {
    var count = 0
    combination(number, [], 0, 3) { selected in
        //reduce는 초기값과 배열의 원소를 하나씩 돌면서 더해준다
        let sum = selected.reduce(0, +) //생략하면
        /* 풀어쓰면
         let sum = selected.reduce(0) { (result, element) -> Int in
             return result + element
         }
         */
        if sum == 0 {
            count += 1
        }
    }
    return count
}

//solution([-2, 3, 0, 2, -5])
//solution([-3, -2, -1, 0, 1, 2, 3])
solution([-1, 1, -1, 1])
