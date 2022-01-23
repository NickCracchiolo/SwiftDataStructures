//
//  PriorityQueue.swift
//  
//
//  Created by Nick Cracchiolo on 1/21/22.
//

import Foundation

struct PriorityQueue<T: Comparable> {
    public var isEmpty: Bool {
        return self.heap.isEmpty
    }
    
    public var count: Int {
        return self.heap.count
    }
    
    public var description: String {
        return self.heap.description
    }
    
    public var first: T? {
        return self.heap.first
    }
    
    private var heap:Heap<T>
    
    init(sort: @escaping(T, T) -> Bool) {
        self.heap = Heap<T>(sort: sort)
    }
    
    public mutating func enque(_ value: T) {
        self.heap.insert(value)
    }
    
    public mutating func deque() -> T? {
        return self.heap.removeFirst()
    }
    
    @discardableResult
    public mutating func remove(_ value: T) -> T? {
        return self.heap.remove(value)
    }
    
    @discardableResult
    public mutating func remove(atIndex i: Int) -> T? {
        return self.heap.remove(atIndex: i)
    }
    
    public func contains(_ value: T) -> Bool {
        return self.heap.contains(value)
    }
}
