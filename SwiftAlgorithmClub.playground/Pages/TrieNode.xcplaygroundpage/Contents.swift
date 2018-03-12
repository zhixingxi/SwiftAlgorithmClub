//: [Previous](@previous)

import Foundation

class TrieNode<T: Hashable> {
    var value: T?
    weak var parent: TrieNode?
    var children: [T: TrieNode] = [:]
    var isTerminating = false
    init(value: T? = nil, parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
    
    func add(child: T) {
        guard children[child] == nil else {return}
        children[child] = TrieNode(value: child, parent: self)
    }
}


class Trie {
    typealias Node = TrieNode<Character>
    fileprivate let root: Node
    
    init() {
        root = Node()
    }
}

extension Trie {
    func insert(word: String) {
        guard !word.isEmpty else {return}
        
        var currentNode = root
        
        for c in word.lowercased() {
            if let child = currentNode.children[c] {
                currentNode = child
            } else {
                currentNode.add(child: c)
                currentNode = currentNode.children[c]!
            }
        }
        currentNode.isTerminating = true
    }
    
    func contains(word: String) -> Bool {
        guard !word.isEmpty else {return false}
        var currentNode = root
        for c in word.lowercased() {
            if let child = currentNode.children[c] {
                currentNode = child
            } else {
                return false
            }
        }
        return currentNode.isTerminating
    }
}

let trie = Trie()
trie.insert(word: "cut")
trie.contains(word: "cut3") // true

trie.contains(word: "cut") // false
trie.insert(word: "cute")
trie.contains(word: "cute") // true



