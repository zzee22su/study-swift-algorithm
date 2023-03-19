//
//  main.swift
//  둘만의_암호
//
//  Created by dylan on 2023/03/19.
//

import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    
    func getUnicode(_ char: Character) -> Int {
        let unicode = Int(UnicodeScalar(String(char))!.value)
        return unicode
    }
    
    func getCharWithUnicode(_ unicode: Int) -> Character {
        return Character(UnicodeScalar(unicode)!)
    }
    
    func getNextChar(_ currentChar: Character) -> Character {
        var lastChar: Character = "z"
        var firstChar: Character = "a"
        
        let currentUnicode = getUnicode(currentChar)
        let lastCharUnicode = getUnicode(lastChar)
        
        return currentUnicode == lastCharUnicode ? firstChar : getCharWithUnicode(currentUnicode + 1)
    }
    
    func getIsSkip(_ char: Character) -> Bool {
        return skip.contains(char)
    }
    
    func changeCharByIndex(_ char: Character, _ index: Int) -> Character {
        var currentChar = char
        var count = 1
        
        while(count <= index) {
            
            let nextChar = getNextChar(currentChar)
            
            currentChar = nextChar
            
            let isSkip = getIsSkip(currentChar)
            if(isSkip) {
                continue
            }
            
            count += 1
        }
        
        return currentChar
    }
    
    var result = ""
    
    for char in s {
        let changedChar = changeCharByIndex(char, index)
        result += String(changedChar)
    }
    
    return result
}

print(solution("aukks", "wbqd", 5))

