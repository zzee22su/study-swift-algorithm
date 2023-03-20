//
//  main.swift
//  Lv.1-둘만의_암호
//
//  Created by zzee22su on 2023/03/20.
//

import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let sAscii = s.map { Int($0.asciiValue!) }
    let skipAscii = skip.map { Int($0.asciiValue!) }
    let z: Int = 122
    var temp: [Int] = []
    
    func checkRange(_ n:Int) -> Int {
        var num: Int = n
        if num > z {
            num = (n - z) + 96
        }
        return num
    }

    for i in sAscii {
        var skipCount: Int = 0
        var newChar: Int = i+index
        
        for j in skipAscii {
            if j <= newChar && j > i {
                skipCount += 1
            }
        }
        temp.append(checkRange(newChar+skipCount))
    }

    let arr = temp.map { String(UnicodeScalar($0)!) }
    
    return arr.joined()
}



//print(solution("aukks","wbqd", 5))
//print(solution("ybcde","az",1))//"bcdef" 출력되어야 함 그러나 "acdef" 출력 됌
print(solution("zzzzzz", "abcdefghijklmnopqrstuvwxy", 6))//"zzzzzz" 출력되어야 함 그러나 "ffffff" 출력 됌
