//
//  main.swift
//  햄버거_만들기
//
//  Created by dylan on 2023/03/26.
//

import Foundation

func solution(_ ingredient:[Int]) -> Int {
    if(ingredient.count < 4) {
        return 0
    }
    
    let ham = "1231"
//    let ham: ArraySlice<Int> = [1, 2, 3, 1]
    var stack: [Int] = []
    var hamCount = 0
    
    func checkHam() -> Bool {
//        return stack.suffix(from: stack.count - 4) == ham
        
        return stack.suffix(from: stack.count - 4).reduce("") { partialResult, ele in
            return partialResult + String(ele)
        } == ham
    }
    
    for ele in ingredient {
        stack.append(ele)
        
        if(stack.count < 4) {
            continue
        }
        
        let top = stack.last
        if(top == 1) {
            let isHam = checkHam()
            if(isHam) {
                stack.removeSubrange(stack.count - 4...stack.count - 1)
                hamCount += 1
            }
        }
    }
    
    return hamCount
}

print(solution([1, 2, 3, 1]))

func test() {
    let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
    let streetsSlice = streets[2..<streets.endIndex]
    
    print(streetsSlice.endIndex, streets.endIndex)
    print(streets.startIndex, streetsSlice.startIndex)
    
    print(streetsSlice[streetsSlice.startIndex])
    print(streetsSlice)
    // Prints "["Channing", "Douglas", "Evarts"]"

    let i = streetsSlice.firstIndex(of: "Evarts")    // 4
    print(i!)
    print(streets[i!])
    // Prints "Evarts"
}

test()

