//
//  Heap.swift
//  
//
//  Created by Nick Cracchiolo on 1/21/22.
//

import Foundation

public struct Heap<T: Comparable>: CustomStringConvertible {
    
    public var isEmpty: Bool {
        return self.array.isEmpty
    }
    
    public var count: Int {
        return self.array.count
    }
    
    public var description: String {
        return self.array.description
    }
    
    public var first: T? {
        return self.array.first
    }
    
    private var array:[T] = []
    private var ordering: (T, T) -> Bool
    
    public init(sort: @escaping(T, T) -> Bool) {
        self.ordering = sort
    }
    
    public func peek() -> T? {
        return self.array.first
    }
    
    public mutating func insert(_ value: T) {
        self.array.append(value)
        self.shiftUp(self.count - 1)
    }
    
    @discardableResult
    public mutating func remove(_ value: T) -> T? {
        guard let i = array.firstIndex(of: value) else { return nil }
        if i == self.count - 1 {
            return self.array.removeLast()
        }
        array.swapAt(i, self.count - 1)
        let value = array.removeLast()
        self.shiftDown(i)
        return value
    }
    
    public mutating func removeFirst() -> T? {
        return self.remove(atIndex: 0)
    }
    
    public mutating func remove(atIndex i: Int) -> T? {
        guard !self.isEmpty, i < self.count else { return nil }
        if i == self.count - 1 {
            return self.array.removeLast()
        }
        if self.count == 1 {
            return self.array.removeFirst()
        }
        array.swapAt(i, self.count - 1)
        let value = array.removeLast()
        self.shiftDown(i)
        return value
    }
    
    public func contains(_ value: T) -> Bool {
        return array.contains(value)
    }
    
    private mutating func shiftUp(_ i: Int) {
        var index = i
        while index > 0 && index < self.count &&
                ordering(array[index], array[parentIndex(of: index)]) {
            array.swapAt(parentIndex(of: index), index)
         
            index = parentIndex(of: index)
        }
    }
    
    private mutating func shiftDown(_ i: Int) {
        var maxIndex = i
        let leftIndex = leftIndex(of: i)
        let rightIndex = rightIndex(of: i)

        if 0 <= leftIndex && leftIndex < count {
            if ordering(array[leftIndex], array[maxIndex]) {
                maxIndex = leftIndex
            }
        }

        if 0 <= rightIndex && rightIndex < count {
            if ordering(array[rightIndex], array[maxIndex]) {
                maxIndex = rightIndex
            }
        }

        if i != maxIndex {
            array.swapAt(i, maxIndex)
            shiftDown(maxIndex)
        }
    }
    
    private func parentIndex(of i: Int) -> Int {
        return (i - 1) / 2
    }
    
    private func hasParent(of i: Int) -> Bool {
        return parentIndex(of: i) > 0
    }
    
    private func parent(of i: Int) -> T? {
        guard hasParent(of: i) else { return nil }
        return array[parentIndex(of: i)]
    }
    
    private func leftIndex(of i: Int) -> Int {
        return (2 * i) + 1
    }
    
    private func hasLeftChild(of i: Int) -> Bool {
        return leftIndex(of: i) < array.count
    }
    
    private func leftChild(of i: Int) -> T? {
        guard hasLeftChild(of: i) else { return nil }
        return array[leftIndex(of: i)]
    }
    
    private func rightIndex(of i: Int) -> Int {
        return (2 * i) + 2
    }
    
    private func hasRightChild(of i: Int) -> Bool {
        return rightIndex(of: i) < array.count
    }
    
    private func rightChild(of i: Int) -> T? {
        guard hasRightChild(of: i) else { return nil }
        return array[rightIndex(of: i)]
    }
}
