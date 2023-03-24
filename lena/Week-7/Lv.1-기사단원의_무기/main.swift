//
//  main.swift
//  Lv.1-기사단원의_무기
//
//  1차 : 통과 + 실패(시간초과)
//  2차 : 통과
//  Created by zzee22su on 2023/03/24.
//

import Foundation

// 1차 : 통과 + 실패(시간초과)
func solution1(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var temp: [Int] = []

    //기사단원의 무기 공격력 구하기
    for i in 1...number {
        let divisors = (1...number).filter{number % $0 == 0} //i의 약수
        temp.append(divisors.count)
    }

    //무기점에서 무기를 구매해야 하는 기사단원의 위치(인덱스) 구하기
    let store = temp.enumerated().filter { $0.element > limit }.map { $0.offset }

    if !store.isEmpty {
        //기사단원의 무기 공격력을 담고 있던 배열에(temp) 무기점에서 구매한 무기의 공격력으로 바꿔 저장한다
        for index in store {
            temp[index] = power
        }
    }

    //기사단원의 무기 공격력을 모두 더해준다
    return temp.reduce(0, +)
}

// 2차 : 통과
func solution2(_ number: Int, _ limit: Int, _ power: Int) -> Int {
    //0부터 number까지의 길이로 '0'으로 초기화한 배열 생성
    //weaponPower[0]은 자리채움 역할 -> 1부터 number까지의 값을 사용해야해서(인덱스 1인 곳부터 저장)
    var weaponPower = Array(repeating: 0, count: number + 1)
    
    for i in 1...number {
        //i간격으로 i부터 number까지 i의 배수들이 저장. (i의 배수는 곧 약수)
        for multiple in stride(from: i, through: number, by: i) {
            //i의 배수들이 위치한 곳에 1씩 더해준다 -> 약수의 개수
            weaponPower[multiple] += 1
        }
    }
    
    //제한수치 초과로 인해 무기점에서 무기를 구매해야 하는 기사단원의 위치(인덱스) 구하기
    let store = (1...number).filter { weaponPower[$0] > limit }
    
    //기사단원의 무기 공격력을 담고 있던 배열에(temp) 무기점에서 구매한 무기의 공격력으로 바꿔 저장한다
    for index in store {
        weaponPower[index] = power
    }

    //기사단원의 무기 공격력을 모두 더해준다
    return weaponPower.reduce(0, +)
}

print(solution(5, 3, 2)) //10
//print(solution(10, 3, 2)) //21

