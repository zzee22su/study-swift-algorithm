//
//  main.swift
//  신규_아이디_추천
//
//  Created by dylan on 2023/04/09.
//

import Foundation

let escapes = "-_.~!@#$%^&*()=+[{]}:?,<>/"

func checkCorrect(_ id: String) -> Bool {
    if(id.count == 0) {
        return false
    }
    
    if(id.count < 3 || id.count > 15) {
        return false
    }
    
    let findedIndex = id.firstIndex { ch in
        if(ch == "." || ch == "-" || ch == "_") {
            return false
        }
        
        return escapes.contains(ch)
    }
    
    guard let _ = findedIndex else { return false }
    
    let firstCh = id.first!
    let lastCh = id.last!
    if(firstCh == "." || lastCh == ".") {
        return false
    }
    
    for (index, ch) in id.enumerated() {
        let curIdx = id.index(id.startIndex, offsetBy: index)
        let nextIdx = id.index(id.startIndex, offsetBy: index + 1)
        
        let curCh = ch
        let nextCh = id[nextIdx]
        
        if(curCh == "." && nextCh == ".") {
            return false
        }
    }
    
    return true
}

func solution(_ new_id:String) -> String {
    // 올바른지 체크 할 필요 없네...
    // let isCorrect = checkCorrect(new_id)
    // if(isCorrect) {
    //     return new_id
    // }
    
    var suggestId = new_id
    
    // step 1
    suggestId = suggestId.lowercased()
    
    print("step 1:", suggestId)
    
    // step 2
    suggestId = suggestId.reduce("") { partialResult, ch in
        if(ch.isLetter) {
            return partialResult + String(ch)
        }

        if(ch.isNumber) {
            return partialResult + String(ch)
        }
        
        if(ch == "." || ch == "_" || ch == "-") {
            return partialResult + String(ch)
        }
        
        return partialResult
    }
    
    print("step 2:", suggestId)
    
    // step 3
    while(suggestId.contains("..")) {
        suggestId = suggestId.replacingOccurrences(of: "..", with: ".")
    }
    
    print("step 3:", suggestId)
    
    // step 4
    let first = suggestId.first!
    let last = suggestId.last!
    
    if(first == ".") {
        suggestId = String(suggestId.dropFirst())
    }
    
    if(last == ".") {
        suggestId = String(suggestId.dropLast())
    }
    
    print("step 4:", suggestId)
    
    // step 5
    if(suggestId.count == 0) {
        suggestId = "a"
    }
    
    print("step 5:", suggestId)
    
    // step 6
    if(suggestId.count > 15) {
        let index = suggestId.index(suggestId.startIndex, offsetBy: 15)
        suggestId = String(suggestId.prefix(upTo: index))
    }
    
    let last2 = suggestId.last!
    if(last2 == ".") {
        suggestId = String(suggestId.dropLast())
    }
    
    print("step 6:", suggestId)
    
    // step 7
    if(suggestId.count < 3) {
        while(suggestId.count < 3) {
            suggestId += String(suggestId.last!)
        }
    }
    
    print("step 7:", suggestId)
    
    return suggestId
}

print(solution("...!@BaT#*..y.abcdefghijklm"))

