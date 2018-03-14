//: [Previous](@previous)
//: Depth-First Search, 深度优先搜索


func depthFirstSearch(from start: Vertex<String>, to end: Vertex<String>, graph: AdjacencyList<String>) -> Stack<Vertex<String>> {
    var visited = Set<Vertex<String>>()
    var stack = Stack<Vertex<String>>()
    
    stack.push(start)
    visited.insert(start)
    
    outer: while let vertex = stack.peek(), vertex != end {
        guard let neighbors = graph.edges(from: vertex), neighbors.count > 0  else {
            print("14backtrack from \(vertex)")
            stack.pop()
            continue
        }
        
        for edge in neighbors {
            if !visited.contains(edge.destination) {
                visited.insert(edge.destination)
                stack.push(edge.destination)
                print(stack.description)
                continue outer
            }
        }
        print("27backtrack from \(vertex)") // 4
        stack.pop()
    }
    
    return stack
}
let adjacencyList = AdjacencyList<String>()
let a = adjacencyList.createVertex(data: "A")
let b = adjacencyList.createVertex(data: "B")
let c = adjacencyList.createVertex(data: "C")
let d = adjacencyList.createVertex(data: "D")
let e = adjacencyList.createVertex(data: "E")
let f = adjacencyList.createVertex(data: "F")
let s = adjacencyList.createVertex(data: "S")
let g = adjacencyList.createVertex(data: "G")

adjacencyList.add(.undirected, from: s, to: a, weight: 0)
adjacencyList.add(.undirected, from: a, to: b, weight: 0)
adjacencyList.add(.undirected, from: a, to: d, weight: 0)
adjacencyList.add(.undirected, from: a, to: c, weight: 0)
adjacencyList.add(.undirected, from: b, to: d, weight: 0)
adjacencyList.add(.undirected, from: d, to: g, weight: 0)
adjacencyList.add(.undirected, from: d, to: f, weight: 0)
adjacencyList.add(.undirected, from: f, to: e, weight: 0)

print(depthFirstSearch(from: s, to: c, graph: adjacencyList))



