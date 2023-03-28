//
//  main.swift
//  Lv.1-햄버거_만들기
//
//  1차 : 실패
//  2차 : 통과 + 실패(시간초과) -> solution2
//  3차 : 통과 -> solution3
//  Created by zzee22su on 2023/03/22.
//

import Foundation

func solution2(_ ingredient:[Int]) -> Int {
    var startPosition: [Int] = [] //빵으로(1) 시작하는 ingredient의 원소를 저장하기 위한 변수
    var copyIngredient: [Int] = ingredient
    var togo: Int = 0 //포장할 수 있는 햄버거 개수를 나타내는 변수

    while true {
        //빵으로(1로) 시작하는 인덱스 모두 찾기
        for i in 0..<copyIngredient.count {
            if copyIngredient[i] == 1 {
                startPosition.append(i)
            }
        }
        
        // 1이 위치하고 있는 인덱스 값을 startPosition 중 앞(i)/뒤로(i+1) 위치해있는 원소 차가 3인 것 중 '첫' 번째 값을 찾아 burger 변수에 저장한다.
        // -> 1,2,3,1(빵,야채,고기,빵)순인데 아래에 쌓는 빵(1)과 위에 쌒는 빵(1)과의 거리가 3씩 차이가 나기 때문.
        var burger: [Int] = []
        for i in 0..<startPosition.count - 1 {
            if startPosition[i + 1] - startPosition[i] == 3 {
                burger = [startPosition[i], startPosition[i + 1]] //burger는 포장할 수 있는 햄버거의 인덱스로 copyIngredient에서 제외시키기 위함
                break
            }
        }
        
        //포장할 수 있는 햄버거 재료가 없다면 while문 탈출
        if burger.count < 1 {
            break
        }
        
        //야채와 고기 재료가 있는지 확인
        if copyIngredient[burger[0]+1] == 2 && copyIngredient[burger[0]+2] == 3 {
            togo += 1 //포장할 수 있는 햄버거가 생겼으므로 1씩 더해준다
        }
        
        
        //포장한 햄버가 재료 삭제
        copyIngredient.removeSubrange(burger[0]...burger[1])

        startPosition.removeAll()
        
        if copyIngredient.count < 4 {
            break
        }
    }
    return togo

}


// 3차시도 통과!!!
func solution3(_ ingredient:[Int]) -> Int {
    var standard: [Int] = [1, 2, 3, 1] //빵, 야채, 고기, 빵
    var temp: [Int] = []
    var burger: Int = 0 //포장가능한 햄버거 개수
    
    for i in ingredient {
        //재료를 하나씩 추가
        temp.append(i)
        if temp.count >= 4 {
            // 뒤에서부터 4개까지의 원소로 비교
            // 만약 temp에 [2, 1, 1, 2, 3]까지 들어와있다면 1, 1, 2, 3이 standard 각 원소와 동일한지 확인
            if temp[temp.count-4...temp.count-1] == standard[0...3] {
                //동일하면 temp 배열에 재료 삭제
                temp.removeSubrange(temp.count-4...temp.count-1)
                burger += 1
            }
        }
    }
    return burger
}


print(solution3([2, 1, 1, 2, 3, 1, 2, 3, 1])) //2
print(solution3([1, 3, 2, 1, 2, 1, 3, 1, 2])) //0
print(solution3([1, 1, 2, 1, 2, 3, 1, 3, 1, 2, 3, 1])) //3
print(solution3([1, 1, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1])) //3
print(solution3([1, 2, 3, 1, 2, 3, 1, 1, 1, 1, 2, 3, 1, 2, 3, 1, 1, 1, 1, 1, 1, 2, 3, 3, 1, 2, 3, 1, 3, 3, 3, 2, 1, 2, 3, 1])) //5
print(solution3([1, 2, 3, 1, 2, 3, 1, 1, 1, 1, 2, 3, 1, 2, 3, 1, 1, 1, 1, 1, 1, 2, 3, 3, 1])) //3
print(solution3([1, 2, 3, 1, 2, 3, 1, 1, 1, 1, 2, 3, 1, 2, 3, 1])) //3
print(solution3([1, 2, 2, 3, 1])) //0


