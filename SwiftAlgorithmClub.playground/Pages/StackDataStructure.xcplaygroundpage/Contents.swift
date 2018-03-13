//: [Previous](@previous)

//: 栈 数据结构, 后进先出

struct Stack<Element> {
    private var array: [Element] = []
    
    mutating func push(_ elemet: Element) {
        array.append(elemet)
    }
    
    mutating func pop() -> Element? {
        return array.popLast()
    }
    
    func peek() -> Element? {
        return array.last
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        let stackElement = array.map {"\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElement + bottomDivider
    }
}

var rwBookStack = Stack<String>()
rwBookStack.push("3D Games by Tutorials")
rwBookStack.push("tvOS Apprentice")
rwBookStack.push("iOS Apprentice")
rwBookStack.push("Swift Apprentice")
rwBookStack.pop()
print(rwBookStack)
