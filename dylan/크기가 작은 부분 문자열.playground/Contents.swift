import UIKit

func solution(_ t:String, _ p:String) -> Int {
    var startP = 0
    var endP = p.count
    var count = 0
    
    while(endP <= t.count) {
        let startStrIndex = t.index(t.startIndex, offsetBy: startP)
        let endStrIndex = t.index(t.startIndex, offsetBy: endP - 1)
        let subStr = t[startStrIndex...endStrIndex]
        
        if(Int(subStr)! <= Int(p)!) {
            count += 1
        }
        
        startP += 1
        endP += 1
    }
    
    return count
}

solution("3141592", "271")
