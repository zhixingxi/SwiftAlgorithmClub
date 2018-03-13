//: [Previous](@previous)
//: 广度优先搜索, 不太明白???

enum Visit<Element: Hashable> {
    case source
    case edge(Edge<Element>)
}

extension Graphable {
    public func breadthFirstSearch(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>]? {
        
        var queue = Queue<Vertex<Element>>()
        queue.enqueue(source)
        var visits: [Vertex<Element>: Visit<Element>] = [source: .source]

        while let visitedVertex = queue.dequeue() {
            if visitedVertex == destination {
                var vertex = destination // 1
                var route: [Edge<Element>] = [] // 2
                
                while let visit = visits[vertex],
                    case .edge(let edge) = visit { // 3
                        
                        route = [edge] + route
                        vertex = edge.source // 4
                        
                }
                return route
            }
            let neighbourEdges = edges(from: source) ?? []
            for edge in neighbourEdges {
                if visits[edge.destination] == nil { // 2
                    queue.enqueue(edge.destination)
                    visits[edge.destination] = .edge(edge) // 3
                }
            }
        }
        return nil
    }
}
