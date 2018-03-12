import Foundation


//顶点
public struct Vertex<T: Hashable> {
    var data: T
}


extension Vertex: Hashable {
    public var hashValue: Int {
        return "\(data)".hashValue
    }
    
    public static func ==(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}


