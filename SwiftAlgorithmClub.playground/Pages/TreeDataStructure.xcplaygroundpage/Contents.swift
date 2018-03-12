//: Playground - noun: a place where people can play

import Foundation
//Remember that a tree is made up of nodes. So to start, let’s create a basic node class
class Node<T> {
    //a node isn’t much use without a value associated with it.
    var value: T
    
    //In addition to a value, each node needs to have a list of children.
    var children: [Node] = []
    
    //Children are the nodes below a given node; the parent is the node above.
    //Note that you’ve made parent an optional. This is because not all nodes have parents – such as the root node in a tree. You’ve also made it weak to avoid retain cycles.
    weak var parent: Node?
    
    init(value: T) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}

// MARK: - description
extension Node: CustomStringConvertible {
    var description: String {
        var text = "\(value)"
        
        // 4
        if !children.isEmpty {
            text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
        }
        return text
    }
}

//MARK: - Search
extension Node where T: Equatable {
    func search(value: T) -> Node? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}

let data = Node(value: 1)

// beverages
let beverages = Node(value: "beverages")
let hotBeverages = Node(value: "hot")
let coldBeverages = Node(value: "cold")
beverages.add(child: hotBeverages)
beverages.add(child: coldBeverages)

// hotBeverages
let tea = Node(value: "tea")
let coffe = Node(value: "coffe")
let cocoa = Node(value: "cocoa")
hotBeverages.add(child: tea)
hotBeverages.add(child: coffe)
hotBeverages.add(child: cocoa)

// coldBeverages
let soda = Node(value: "soda")
let milk = Node(value: "milk")
coldBeverages.add(child: soda)
coldBeverages.add(child: milk)

//tea
let black = Node(value: "black")
let green = Node(value: "green")
let chai = Node(value: "chai")
tea.add(child: black)
tea.add(child: green)
tea.add(child: chai)

//soda
let gingerAle = Node(value: "gingerAle")
let bitterLemon = Node(value: "bitterLemon")
soda.add(child: gingerAle)
soda.add(child: gingerAle)

print(beverages.description)
beverages.search(value: "milk")
beverages.search(value: "bubbly")
