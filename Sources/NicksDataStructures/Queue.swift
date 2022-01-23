//
//  Queue.swift
//  
//
//  Created by Nick Cracchiolo on 1/20/22.
//

import Foundation


struct Queue<T: Comparable & AdditiveArithmetic> {
    
    public var isEmpty: Bool {
        return self.list.isEmpty
    }
    
    public var count: Int {
        return self.list.count
    }
    
    private var list: LinkedList<T>
    
    init() {
        self.list = LinkedList<T>()
    }
    
    public mutating func enque(_ value: T) {
        self.list.prepend(value)
    }
    
    public mutating func deque() -> T? {
        return self.list.removeLast()
    }
}