import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var sortedArray = score.sorted { $0 < $1 }
    let fruitNumberPerBox = m
    var answer = 0
    var fruitBox: [Int] = []
    while !sortedArray.isEmpty {
        fruitBox.append(sortedArray.removeLast())
        if fruitBox.count == fruitNumberPerBox {
            answer += fruitBox.min()! * fruitNumberPerBox
            fruitBox.removeAll(keepingCapacity: true)
        }
    }
    return answer
}


// 1차 실패 원인
// Array를 오름차순 정렬 후 removeFirst()

// 해결
// Array를 내림차순 정렬 후 removeLast()
