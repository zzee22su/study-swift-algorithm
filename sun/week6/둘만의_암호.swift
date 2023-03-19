import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    
    let skipList = Array(skip)
    let alphabetList: Array<Character> = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q","r", "s", "t", "u", "v", "w", "x", "y", "z"]
  
    var result = [Character](repeating: " ", count: s.count)
    for (idx, c) in s.enumerated() {
        var cIndex = alphabetList.firstIndex(of: c)!
        var loopCount = 0
        while(true) {
            // z를 넘어가는지 확인
            if cIndex + 1 >= alphabetList.count {
                cIndex = -1
            }
            
            let char = alphabetList[cIndex + 1]
            if skipList.contains(char) {
                cIndex += 1
                continue
            }
            
            loopCount += 1
            cIndex += 1
            if loopCount == index {
                result[idx] = char
                break
            }
        }
    }
    
    return String(result)
}
