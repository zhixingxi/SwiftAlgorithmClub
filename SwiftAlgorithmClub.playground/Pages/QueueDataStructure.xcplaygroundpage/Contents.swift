//: [Previous](@previous)
//: 队列 数据结构, 先进先出
public struct Queue<T> {
    private var list = LinkedList<T>()
    public func enqueue(_ element: T) {
        list.append(value: element)
    }
    
    public func dequeue() -> T? {
        guard list.isEmpty, let element = list.first else {
            return nil
        }
        list.remove(node: element)
        return element.value
    }
    
    public func peak() -> T? {
        return list.first?.value
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
}

extension Queue: CustomStringConvertible {
    // 2
    public var description: String {
        // 3
        return list.description
    }
}

var queue = Queue<Int>()
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(1)
print(queue)
var queueS = Queue<String>()
queueS.enqueue("21sfdaf")
queueS.enqueue("31sfad")
queueS.enqueue("11dsfdfs")
print(queueS)



