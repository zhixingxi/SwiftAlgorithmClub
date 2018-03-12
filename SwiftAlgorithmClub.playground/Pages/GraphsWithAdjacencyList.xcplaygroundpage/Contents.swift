//: [Previous](@previous)
//: 邻接表


let adjacencyList = AdjacencyList<String>()

let beijign = adjacencyList.createVertex(data: "北京")
let shanghai = adjacencyList.createVertex(data: "上海")
let guangzhou = adjacencyList.createVertex(data: "广州")
let shenzhen = adjacencyList.createVertex(data: "深圳")
let hangzhou = adjacencyList.createVertex(data: "杭州")

adjacencyList.add(.undirected, from: beijign, to: shanghai, weight: 300)
adjacencyList.add(.undirected, from: beijign, to: guangzhou, weight: 1000)
adjacencyList.add(.undirected, from: beijign, to: shenzhen, weight: 2000)
adjacencyList.add(.undirected, from: beijign, to: hangzhou, weight: 800)
adjacencyList.add(.undirected, from: shanghai, to: hangzhou, weight: 100)


print(adjacencyList.description)

adjacencyList.weight(from: beijign, to: shanghai)
print(adjacencyList.edges(from: shanghai)?.map({ (edge) in
    return edge.destination
}))













