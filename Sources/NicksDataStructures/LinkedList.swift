//
//  LinkedList.swift
//  
//
//  Created by Nick Cracchiolo on 1/20/22.
//

import Foundation

struct LinkedList<T: Comparable & AdditiveArithmetic>: CustomStringConvertible {
    
    // MARK: Private Node class
    private class Node<T: Comparable>: CustomStringConvertible, Equatable {
        let value: T
        var prev: Node?
        var next: Node?
        
        var description: String {
            return "(\(self.value))"
        }
        
        init(value: T) {
            self.value = value
        }
        
        func dispose() {
            self.prev = nil
            self.next = nil
        }
        
        static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
            return lhs.value == rhs.value &&
                lhs.next === rhs.next &&
                lhs.prev === rhs.prev
        }
    }
    
    /// The first node in the list
    private var root: Node<T>?
    /// The last node in the list
    private var tail: Node<T>?
    /// The internal number of items in the list
    private var _count = 0
    
    /// Returns if the list is empty or not
    public var isEmpty: Bool {
        return root == nil
    }
    
    /// Returns the count of the number of items in the LinkedList
    public var count: Int {
        return self._count
    }
    
    /// Returns a string of the LinkedList in order.
    /// If you want the value of each item to be printed nicely make sure the value comforms to the CustomStringConverible protocol
    public var description: String {
        var str: String = ""
        var node: Node<T>? = self.root
        while let n = node {
            str.append(n.description)
            if n.next != nil {
                str.append(" -> ")
            }
            node = n.next
        }
        return str
    }
    
    /// Initializes a new LinekdList with at most 1 value. If you leave the parm empty or nil, the list will be initialized empty.
    public init(_ value: T? = nil) {
        if let v = value {
            self.append(v)
        }
    }
    
    /// Initializes a new LinekdList with an array of values. If you leave the parm empty or nil, the list will be initialized empty.
    /// The linked list will be ordered following the ordering in the input array
    public init(_ values: [T]) {
        for v in values {
            self.append(v)
        }
    }
    
    public mutating func append(_ value: T) {
        let new = Node(value: value)
        if root == nil {
            root = new
        }
        new.prev = tail
        tail?.next = new
        tail = new
        self._count += 1
    }
    
    public mutating func prepend(_ value: T) {
        let new = Node(value: value)
        new.next = root
        root?.prev = new
        self.root = new
        self._count += 1
    }
    
    public mutating func remove(_ value: T) {
        guard let r = root else { return }
        var node: Node<T>? = r
        while let n = node {
            if n.value == value {
                if n.prev == nil {
                    self.root = n.next
                } else if n.next == nil {
                    self.tail = n.prev
                    n.prev?.next = nil
                } else {
                    n.prev?.next = n.next
                    n.next?.prev = n.prev
                }
                n.dispose()
                self._count -= 1
                return
            }
            node = n.next
        }
    }
    
    public mutating func removeFirst() -> T? {
        guard let r = root else { return nil }
        self.root = r.next
        r.next?.prev = nil
        r.dispose()
        return r.value
    }
    
    public mutating func removeLast() -> T? {
        guard let t = tail else { return nil }
        self.tail = t.prev
        t.prev?.next = nil
        t.dispose()
        return t.value
    }
    
    public func toArray() -> [T] {
        var values: [T] = []
        var node = self.root
        while let n = node {
            values.append(n.value)
            node = n.next
        }
        return values
    }
    
    public func reversed() -> LinkedList<T> {
        var list = LinkedList<T>()
        var node = tail
        while let n = node {
            list.append(n.value)
            node = n.prev
        }
        return list
    }
    
    public func value(atIndex i:Int) -> T? {
        guard i < self.count else { return nil }
        var j = 0
        var node = self.root
        while j < self.count {
            if j == i {
                return node?.value
            }
            j += 1
            node = node?.next
        }
        return node?.value
    }
    
    public mutating func sort(ascending: Bool) {
        var node = root
        print(self)
        while let n = node {
            var next = n.next
            while var nxt = next {
                print("n: \(n), nxt: \(nxt)")
                if ascending {
                    if n.value > nxt.value {
                        print("Swapping \(n) and \(nxt)")
                        self.swap(n, nxt)
                        print("here")
                        //nxt = n
                        print(self)
                    }
                } else {
                    if n.value < nxt.value {
                        print("Swapping \(n) and \(nxt)")
                        self.swap(n, nxt)
                        //nxt = n
                        print(self)
                    }
                }
                print("here 2")
                next = nxt.next
            }
            node = n.next
        }
    }
    
    private mutating func swap(_ a:Node<T>, _ b:Node<T>) {
        let aPrev = a.prev
        let aNext: Node<T>?
        let bPrev: Node<T>?
        if a.next == b {
            aNext = b
            bPrev = b.next?.prev
        } else {
            aNext = a.next
            bPrev = a.prev
        }
        if a.prev == nil {
            self.root = b
        }
        if b.next == nil {
            self.tail = a
        }
        a.next = b.next
        a.prev?.next = b
        a.prev = bPrev
        
        b.next?.prev = a
        b.prev = aPrev
        b.next = aNext
    }
    
    public static func + (lhs: LinkedList<T>, rhs:LinkedList<T>) -> LinkedList<T> {
        var list = LinkedList<T>()
        let max = max(lhs.count, rhs.count)
        for i in 0..<max {
            if let v1 = lhs.value(atIndex: i) {
                var value = v1
                if let v2 = rhs.value(atIndex: i) {
                    value += v2
                }
                list.append(value)
            } else {
                if let v2 = rhs.value(atIndex: i) {
                    list.append(v2)
                }
            }
        }
        return list
    }
    
    static func == (lhs: LinkedList<T>, rhs: LinkedList<T>) -> Bool {
        guard lhs.count == rhs.count else { return false }
        var node1: Node<T>? = lhs.root
        var node2: Node<T>? = rhs.root
        while let n1 = node1, let n2 = node2 {
            if n1.value != n2.value {
                return false
            }
            node1 = n1.next
            node2 = n2.next
        }
        return true
    }
}
