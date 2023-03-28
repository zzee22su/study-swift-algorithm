//
//  main.swift
//  Lv.1-키패드_누르기
//
//  Created by zzee22su on 2023/03/26.
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let leftNum = [1:[0, 0], 4:[1, 0], 7:[2, 0], 10:[3,0]] //왼쪽 키패드의 위치, 10은 *
    let rightNum = [3:[0, 2], 6:[1, 2], 9:[2, 2], 20:[3,2]] //오른쪽 키패드의 위치, 20은 #
    let middleNum = [2:[0,1], 5:[1,1], 8:[2,1], 0:[3,1]] //중간 키패드의 위치
    var leftKeypad: [Int] = [10] //10은 *
    var rightKeypad: [Int] = [20] //20은 #
    var result: [String] = []
    var leftTemp: [[Int]] = []
    var rightTemp: [[Int]] = []
    var exit: Bool = false //반복문을 탈출하기 위한 변수

    for i in 0..<numbers.count {
        exit = false
        
        //numbers로 들어온 숫자 중 leftNum의 key와 같은지 확인
        for j in leftNum.keys {
            if numbers[i] == j {
                //있으면 저장하고 반복문 탈출
                result.append("L")
                leftKeypad.append(numbers[i])
                exit = true
                break
            }
        }
        
        if exit { continue }
        
        //numbers로 들어온 숫자 중 rightNum의 key와 같은지 확인
        for j in rightNum.keys {
            if numbers[i] == j {
                //있으면 저장하고 반복문 탈출
                result.append("R")
                rightKeypad.append(numbers[i])
                exit = true
                break
            }
        }
        
        if exit { continue }
        
        //numbers의 첫 번째 원소 값이 2, 5, 8, 0으로 시작할 경우 result는 빈 배열값이기 때문에 result로 구분
        //*이랑(10) #이랑(20) 비교했을때 2, 5, 8, 0의 거리가 같으므로 hand에 따라 결정한다
        if result.isEmpty {
            if hand == "left" {
                result.append("L")
                leftKeypad.append(numbers[i])
            } else {
                result.append("R")
                rightKeypad.append(numbers[i])
            }
            continue
        }
        
        //result값이 비어있지 않고(2, 5, 8, 0이 첫 번째 원소값으로 들어오지 않고) 2, 5, 8, 0이 들어왔을 경우
        //이전에 왼쪽 키패드에서 눌렀던 원소 값을 가져와 왼쪽키패드의 위치를 찾고 그 위치를 leftTemp에 저장
        //이전에 눌렀던 원소 값이 왼쪽키패드에 없다면(이전에 눌렀던 값이 중간 키패드에 위치하는 값이였기 때문) 중간 키패드 값에서 찾아 저장한다
        if let lLast = leftKeypad.last {
            if let last = leftNum[lLast] {
                leftTemp.append(last)
            } else {
                leftTemp.append(middleNum[lLast]!)
            }
        }

        if let RLast = rightKeypad.last {
            if let last = rightNum[RLast] {
                rightTemp.append(last)
            } else {
                rightTemp.append(middleNum[RLast]!)
            }
        }

        //2, 5, 8, 0이 들어왔을 경우 이전 왼쪽키패드에서 눌렀던 원소 값의 거리와 이전 오른쪽키패드에서 눌렀던 원소 값의 거리를 비교해야 한다
        //예를들어, 현재 8이라는 숫자가 들어왔을 때(numbers[i]) 8의 위치는 [2,1]이다
        //이전에 눌렀던 왼쪽/오른쪽 키패드가 각각 왼쪽:4 [1,0] 오른쪽:3 [0,2]라고 가정했을 때
        // leftDist = |2-1|+|1-0| -> 2
        // rightDist = |2-0|+|1-2| -> 3 가 나온다.
        //이 결과값에서 왼쪽키패드에서 8을 누르는게 더 빠르게 누를 수 있기 때문에 이 경우에는 왼손으로 키패드를 누르게 된다.
        var leftDist = abs((middleNum[numbers[i]]?[0] ?? 0) - leftTemp[0][0]) + abs((middleNum[numbers[i]]?[1] ?? 0) - leftTemp[0][1])
        var rightDist = abs((middleNum[numbers[i]]?[0] ?? 0) - rightTemp[0][0]) + abs((middleNum[numbers[i]]?[1] ?? 0) - rightTemp[0][1])
        
        if leftDist > rightDist {
            result.append("R")
            rightKeypad.append(numbers[i])
        } else if leftDist < rightDist {
            result.append("L")
            leftKeypad.append(numbers[i])
        } else if leftDist == rightDist {
            //거리가 같으면 hand로 판단한다
            if hand == "left" {
                result.append("L")
                leftKeypad.append(numbers[i])
            } else {
                result.append("R")
                rightKeypad.append(numbers[i])
            }
        }

        leftTemp.removeAll()
        rightTemp.removeAll()
        
    }
    
    return result.reduce("") { $0 + $1 }
}


//print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right")) //"LRLLLRLLRRL"
//print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left")) //"LRLLRRLLLRR"
print(solution([1, 2, 3, 4, 5, 6, 7, 8, 9, 0], "right")) //"LLRLLRLLRL"
