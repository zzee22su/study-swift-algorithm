//
//  main.swift
//  Lv.1-둘만의_암호
//  다시 풀이해야 함....ㅠ
//  Created by zzee22su on 2023/03/20.
//

import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let sAscii = s.map { Int($0.asciiValue!) }
    let skipAscii = skip.map { Int($0.asciiValue!) }
    let aAscii = 97
    let zAscii = 122
    var temp: [Int] = []
    
    func checkRange(_ n: Int) -> Int {
        var num = n
        if num > zAscii {
            num -= 26
        } else if num < aAscii {
            num += 26
        }
        return num
    }
    
    for i in sAscii {
        var skipCount: Int = 0
        var newChar: Int = i+index
        
        for j in skipAscii {
            if j <= newChar {
                skipCount += 1
            }
        }
        
        newChar = checkRange(newChar+skipCount)
        
        while skipAscii.contains(newChar) {
            skipCount += 1
            newChar = checkRange(newChar+1)
        }
        
        temp.append(newChar)
    }
    
    let arr = temp.map { String(UnicodeScalar($0)!) }
    
    return arr.joined()
}

print(solution("ybcde","az",1))//"bcdef" 출력되어야 함 그러나 "acdef" 출력 됌
print(solution("aukks","wbqd", 5))// "happy" 출력되어야 함 그러나 "herrc" 출력 됌
print(solution("zzz","a",1))
print(solution("zzzzzz", "abcdefghijklmnopqrstuvwxy", 6))//"zzzzzz" 출력되어야 함 그러나 "ffffff" 출력 됌
