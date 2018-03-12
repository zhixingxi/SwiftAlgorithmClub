import Foundation

//Graphable
protocol Graphable {
    associatedtype Element: Hashable
    
    var description: CustomStringConvertible { get }
    
    func createVertex(data: Element) -> Vertex<Element>
    
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? // 5
    func edges(from source: Vertex<Element>) -> [Edge<Element>]? // 6
}
