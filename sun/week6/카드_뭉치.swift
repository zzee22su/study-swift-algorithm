import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {

    var c1 = cards1
    var c2 = cards2
    var g = goal
    while (true) {
        if g.count == 0 || (c1.count == 0 && c2.count == 0) {
            break
        }
        
        let word = g.first
        
        if c1.first == word {
            c1.removeFirst()
            g.removeFirst()
            continue
        }
        
        if c2.first == word {
            c2.removeFirst()
            g.removeFirst()
            continue
        }
        
        return "No"
    }
    
    return "Yes"
}
