import UIKit

/*: Lv.1 - 옹알이(2) (https://school.programmers.co.kr/learn/courses/30/lessons/133499)
 > 머쓱이는 태어난 지 11개월 된 조카를 돌보고 있습니다. 조카는 아직 "aya", "ye", "woo", "ma" 네 가지 발음과 네 가지 발음을 조합해서 만들 수 있는 발음밖에 하지 못하고 연속해서 같은 발음을 하는 것을 어려워합니다. 문자열 배열 babbling이 매개변수로 주어질 때, 머쓱이의 조카가 발음할 수 있는 단어의 개수를 return하도록 solution 함수를 완성해주세요.
 - 제한사항
     - 1 ≤ babbling의 길이 ≤ 100
     - 1 ≤ babbling[i]의 길이 ≤ 30
     - 문자열은 알파벳 소문자로만 이루어져 있습니다.
 */


func solution(_ babbling:[String]) -> Int {
    let original = ["aya", "ye", "woo", "ma"]
    var result = 0

    for i in babbling {
        var temp = i
        for j in original {
            //파라미터로 받은 옹알이 중 연속된 발음이 있는지 체크
            if temp.contains(j + j) {
                print("i: \(i), j: \(j)")
                break
            }
            //original발음과 같은 발음을 !로 치환하면서 누적저장
            temp = temp.replacingOccurrences(of: j, with: "!")
        }
        //!로 이루어진 옹알이는 발음할 수 있는 단어.
        //발음할 수 있는 단어 개수와 누적저장된 temp에 개수를 비교
        if temp.filter({ $0 == "!" }).count == temp.count {
            result += 1
        }
    }
    
    return result
}

//solution(["aya", "yee", "u", "maa", "wyeoo"])
solution(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"])
 
