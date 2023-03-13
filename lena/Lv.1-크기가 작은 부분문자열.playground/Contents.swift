import UIKit

/*:Lv.1 - 크기가 작은 부분문자열
 > 숫자로 이루어진 문자열 t와 p가 주어질 때, t에서 p와 길이가 같은 부분문자열 중에서, 이 부분문자열이 나타내는 수가 p가 나타내는 수보다 작거나 같은 것이 나오는 횟수를 return하는 함수 solution을 완성하세요.예를 들어, t="3141592"이고 p="271" 인 경우, t의 길이가 3인 부분 문자열은 314, 141, 415, 159, 592입니다. 이 문자열이 나타내는 수 중 271보다 작거나 같은 수는 141, 159 2개 입니다.

 - 제한사항
     - 1 ≤ p의 길이 ≤ 18
     - p의 길이 ≤ t의 길이 ≤ 10,000
     - t와 p는 숫자로만 이루어진 문자열이며, 0으로 시작하지 않습니다.

 */
func solution(_ t:String, _ p:String) -> Int {
    let length = p.count
    var pick: [Int] = []
    var count: Int = 0

    for i in 0...(t.count - length) {
        let startIndex = t.index(t.startIndex, offsetBy: i)   //3부터 1부터 4부터 1부터 5부터
        let endIndex = t.index(startIndex, offsetBy: length - 1)//4까지 1까지 5까지 9까지 2까지
        let subString = String(t[startIndex...endIndex]) //314, 141, 415, 159, 592
        guard let convertStrToInt = Int(subString) else { return 0 }
        pick.append(convertStrToInt)
    }
    
    //값 비교
    for i in 0..<pick.count {
        if pick[i] <= Int(p)! {
            count += 1
        }
    }
    
    return count
}

//solution("3141592", "271")
//solution("500220839878", "7")
solution("10203", "15")
