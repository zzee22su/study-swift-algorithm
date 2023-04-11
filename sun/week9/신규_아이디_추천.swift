import Foundation

func solution(_ new_id:String) -> String {
    var reservedChracters: [Character] = ["~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "=", "+", "[", "{", "]", "}", ":", "?", ",", "<", ">", "/"]
    
    var recommendId = new_id
    
    // 1단계: new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
    recommendId = recommendId.lowercased()
    
    // 2단계: new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
    recommendId = String(Array(recommendId).filter { return !reservedChracters.contains($0) })
    
    // 3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
    while (true) {
        if recommendId.contains("..") {
            recommendId = recommendId.replacingOccurrences(of: "..", with: ".")
        } else {
            break
        }
    }
    
    // 4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
    if recommendId.first! == "." {
        recommendId.removeFirst()
    }
    if let last = recommendId.last{
        if last == "." {
            recommendId.removeLast()
        }
    }
    
    // 5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
    if recommendId.count == 0 {
        recommendId = "a"
    }
    
    // 6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
    //     만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
    if recommendId.count >= 16 {
        let removeFirstIndex = recommendId.index(recommendId.startIndex, offsetBy: 15)
        let removelastIndex = recommendId.index(recommendId.startIndex, offsetBy: recommendId.count)
        recommendId.removeSubrange(removeFirstIndex..<removelastIndex)
    }
    
    if recommendId.last! == "." {
        recommendId.removeLast()
    }
    
    //7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
    if recommendId.count <= 2 {
        let last = recommendId.last!
        while (true) {
            if recommendId.count == 3 {
                break
            }
            
            recommendId.append(last)
        }
    }
    
    return recommendId
}

solution("...!@BaT#*..y.abcdefghijklm") // "bat.y.abcdefghi"
solution("abcdefghijklmn.p") //"abcdefghijklmn"
solution("123_.def") //"123_.def"
solution("=.=") //"aaa"
