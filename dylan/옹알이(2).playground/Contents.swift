import Foundation

func solution(_ babbling: [String]) -> Int {
    var stack: Array<String> = []
    var count = 0
    
    let pronunciations = ["aya", "ye", "woo", "ma"]
    
    func checkAvailable(_ str: String) -> Bool {
        return pronunciations.contains(str)
    }
    
    for babble in babbling {
        var str = ""
        for word in babble {
            str += String(word)
            
            let isAvailable = checkAvailable(str)
            if(isAvailable) {
                if(str == stack.last) {
                    stack.popLast()
                } else {
                    stack.append(str)
                }
                
                str = ""
            }
        }
        
        if(babble == stack.joined()) {
            count += 1
        }
        
        stack = []
    }
    
    return count
}

solution(["ayaye", "uuu", "yeyemaye", "yemawoo", "ayamaaya"])
