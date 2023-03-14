import Foundation

func solution(_ number:[Int]) -> Int {
    
    let combinations = combination(number, 3)
    
    let sumResultArr = combinations.map { $0.reduce(0) {$0 + $1} }
    
    return sumResultArr.filter{ $0 == 0 }.count
}

func combination<T>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    
    if array.isEmpty || array.count < n
    {
        return result
    }

    func combi(_ index: Int, _ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }

        for i in index..<array.count {
            combi(i + 1, now + [array[i]])
        }
    }

    combi(0, [])

    return result
}
