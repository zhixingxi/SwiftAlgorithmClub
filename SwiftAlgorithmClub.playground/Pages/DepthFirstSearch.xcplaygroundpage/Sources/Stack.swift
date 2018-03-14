//: 栈 数据结构, 后进先出

public struct Stack<Element> {
    private var array: [Element] = []
    public init() {}
    public mutating func push(_ elemet: Element) {
        array.append(elemet)
    }
    
    public mutating func pop() -> Element? {
        return array.popLast()
    }
    
    public func peek() -> Element? {
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
    public var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        let stackElement = array.map {"\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElement + bottomDivider
    }
}
