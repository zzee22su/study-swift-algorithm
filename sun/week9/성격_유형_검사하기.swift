import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    
    let scoreMap : [Int:Int] = [1:3, 2:2, 3:1, 4:0, 5:1, 6:2, 7:3]
    var typeMap: [Character: Int] = ["R":0, "T":0, "C":0, "F":0, "J":0, "M":0, "A":0, "N":0]
    
    for (idx, value) in survey.enumerated() {
        let first = value.first!
        let last = value.last!
        
        let choice = choices[idx]
        if choice < 4 {
            typeMap[first]! += scoreMap[choice]!
        }
        else {
            typeMap[last]! += scoreMap[choice]!
        }
    }
    
    var result = [String]()
    result.append(typeMap["R"]! >= typeMap["T"]! ? "R" : "T")
    result.append(typeMap["C"]! >= typeMap["F"]! ? "C" : "F")
    result.append(typeMap["J"]! >= typeMap["M"]! ? "J" : "M")
    result.append(typeMap["A"]! >= typeMap["N"]! ? "A" : "N")
    
    return result.joined()
}

