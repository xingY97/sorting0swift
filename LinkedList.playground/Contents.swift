import UIKit

struct LinkedList<Value> {
    //a linkedList will have a head and a tail
    var head: Node<Value>?
    var tail: Node<Value>?
    
    //tell us if the linkedlist is empty or not
    var isEmpty: Bool {
        //if the head is nil, then the list is empty
        return head == nil
    }
    
    mutating func push(_ value: Value) {
        // the next node will be the current head
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head //if the tail is nil, then only head exist
        }
    }
    
    //find the node position at an index, with a generic Value type of node
    func node(at index:Int) -> Node<Value>? {
        
        var currentIndex = 0 // look for the node one by one
        var currentNode = head //start looking for the node from the head
        
        while(currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1 //move to next index before the Node is found
        }
        return currentNode //break the loop if the Node is found at currentPosition
    }
    //insert a value that we wanted, and after the node we want to insert
    func insert(_ value: Value, after node: Node<Value>) {
        node.next = Node(value: value, next: node.next)
    }
    
    mutating func append(_ value: Value) {
        //check if the list is not empty
        guard !isEmpty else {
            push(value)
            return
        }
        
        let node = Node(value: value)
        tail!.next = node
        tail = node
        
    }
    mutating func pop() -> Value? {
        //defer will run after the value has been returned
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        
        return head?.value
        
    }
    
    mutating func removelast() -> Value? {
        //if the list is empty, then return nil
        guard let head = head else {
            return nil
        }
        
        //if the list has only one element
        guard head.next != nil else {
            return pop()
        }
        
        var previous = head
        var current = head
        //search the item in the linkedlist
        while let next = current.next {
            previous = current //move the current value into previous one
            current = next // going through the linkedlist until we find the next nil value
        }
        //if next of previous one is nil
        previous.next = nil
        //tail become the previous one
        tail = previous
        return current.value
    }
    
    mutating func remove(after node: Node<Value>) -> Value? {
        
        do {
            //if there is only one element
            if node.next === tail {
                tail = node
            }
            //10->1->3 ---- 10->3
            node.next = node.next?.next
        }
        return node.next?.value
        
    }
    
    
    init() { }
        
    }

extension LinkedList: CustomStringConvertible {
        
        var description: String {
            
            guard let head = head else {
                return "Empty List"
            }
            return String(describing: head)
        }
        
    }

class Node<Value> {
    
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    
}

extension Node: CustomStringConvertible {
    
    var description: String {
        
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next) + " "
    }
}

var list = LinkedList<Int>()
list.append(10)
list.append(1)
list.append(3)

print("before remove")
print(list)
let index = 1
let node = list.node(at: index - 1) //now index is 0 since index starts at 0
let removedValue = list.remove(after: node!)
print(list)
