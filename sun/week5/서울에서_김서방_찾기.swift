func solution(_ seoul:[String]) -> String {
    
    for (index, value) in seoul.enumerated() {
        if value == "Kim" {
            return "김서방은 \(index)에 있다"
        }
    }
    
    return ""
}
