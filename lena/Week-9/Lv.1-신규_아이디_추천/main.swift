//
//  main.swift
//  Lv.1-신규_아이디_추천
//
//  Created by zzee22su on 2023/04/11.
//

import Foundation

func solution(_ new_id:String) -> String {
    var tempId = new_id
    
    //1. 대문자 -> 소문자
    tempId = tempId.lowercased()
    
    //2. 알파벳 소문자, 숫자, -, _, .를 제외한 모든 문자를 제외시킨다
    //3. + .이 두번이상(..) 연속될 경우 .로 치환시킨다
    //4. .가 처음이나 끝에 존재한다면 삭제시킨다
    let pattern = "[^a-z0-9-_.]+"
    tempId = tempId.replacingOccurrences(of: pattern, with: "", options: [.regularExpression, .caseInsensitive])
    tempId = tempId.replacingOccurrences(of: "\\.{2,}", with: ".", options: [.regularExpression, .caseInsensitive])
    tempId = tempId.trimmingCharacters(in: ["."])
    
    //5. 빈 문자열일 경우에는 a 추가
    if tempId.isEmpty {
        tempId += "a"
    } else if tempId.count >= 16  { //6. 문자열 길이가 16자 이상이면 15자 이후부터는 모두 제거
        let index = tempId.index(tempId.startIndex, offsetBy: 15)
        tempId = String(tempId[..<index])
        tempId = tempId.trimmingCharacters(in: ["."])
    }
    
    //7. 문자열 길이가 2자 이하이면 문자열의 길이가 3이 될때까지 마지막 문자를 끝에 붙인다
    while tempId.count <= 2 {
        tempId += String(tempId.last!)
    }
    
    return tempId
}




//print(solution(".ABC%bbbbbbbbbbbbbbb")) //
print(solution("...!@BaT#*..y.abcdefghijklm")) //"bat.y.abcdefghi"
print(solution("z-+.^.")) //"z--"
print(solution("=.=")) //"aaa"
print(solution("123_.def")) //"123_.def"
print(solution("abcdefghijklmn.p")) //"abcdefghijklmn"

