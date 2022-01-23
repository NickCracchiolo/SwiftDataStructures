//
//  HeapTests.swift
//  
//
//  Created by Nick Cracchiolo on 1/22/22.
//

import XCTest
@testable import NicksDataStructures

class HeapTests: XCTestCase {

    func testMinHeapInsert() throws {
        var heap = Heap<Int>.init { a, b in
            return a < b
        }
        
        heap.insert(10)
        
        XCTAssertEqual(heap.description, "[10]")
        
        heap.insert(20)
        heap.insert(15)
        XCTAssertEqual(heap.description, "[10, 20, 15]")
        
        heap.insert(11)
        XCTAssertEqual(heap.description, "[10, 11, 15, 20]")
    }
    
    func testMaxHeapInsert() throws {
        var heap = Heap<Int>.init { a, b in
            return a > b
        }
        
        heap.insert(10)
        
        XCTAssertEqual(heap.description, "[10]")
        
        heap.insert(20)
        heap.insert(15)
        XCTAssertEqual(heap.description, "[20, 10, 15]")
        
        heap.insert(11)
        XCTAssertEqual(heap.description, "[20, 11, 15, 10]")
    }
    
    func testHeapContains() throws {
        var heap = Heap<Int>.init { a, b in
            return a > b
        }
        
        heap.insert(10)
        heap.insert(20)
        heap.insert(15)
        heap.insert(11)
        
        XCTAssertEqual(heap.contains(10), true)
        XCTAssertEqual(heap.contains(20), true)
        XCTAssertEqual(heap.contains(15), true)
        XCTAssertEqual(heap.contains(11), true)
        
        XCTAssertEqual(heap.contains(1), false)
        XCTAssertEqual(heap.contains(2), false)
        XCTAssertEqual(heap.contains(50), false)
        XCTAssertEqual(heap.contains(16), false)
    }

    func testMaxHeapRemoveValue() throws {
        var heap = Heap<Int>.init { a, b in
            return a > b
        }
        
        heap.insert(10)
        
        XCTAssertEqual(heap.description, "[10]")
        
        heap.insert(20)
        heap.insert(15)
        XCTAssertEqual(heap.description, "[20, 10, 15]")
        
        heap.insert(11)
        XCTAssertEqual(heap.description, "[20, 11, 15, 10]")
        
        heap.remove(11)
        XCTAssertEqual(heap.description, "[20, 10, 15]")
        
        heap.remove(20)
        XCTAssertEqual(heap.description, "[15, 10]")
    }
    
    func testHeapRemoveIndex() throws {
        var heap = Heap<Int>.init { a, b in
            return a < b
        }
        heap.insert(10)
        
        let ten = heap.removeFirst()
        XCTAssertEqual(heap.isEmpty, true)
        XCTAssertEqual(ten, 10)
        heap.insert(10)
        heap.insert(12)
        let _ = heap.removeFirst()
        XCTAssertEqual(heap.description, "[12]")
        heap.insert(8)
        XCTAssertEqual(heap.description, "[8, 12]")
        let shouldBeNil = heap.remove(atIndex: 2)
        XCTAssertEqual(shouldBeNil, nil)
        
        let twelve = heap.remove(atIndex: 1)
        XCTAssertEqual(heap.count, 1)
        XCTAssertEqual(heap.description, "[8]")
        XCTAssertEqual(twelve, 12)
    }
    
    func testMinHeapRemove() throws {
        var heap = Heap<Int>.init { a, b in
            return a < b
        }
        
        heap.insert(10)
        heap.insert(20)
        heap.insert(15)
        heap.insert(11)
        heap.insert(4)
        heap.insert(12)
        heap.insert(3)
        heap.insert(7)
        XCTAssertEqual(heap.description, "[3, 7, 4, 10, 11, 15, 12, 20]")
        
        heap.remove(7)
        XCTAssertEqual(heap.description, "[3, 10, 4, 20, 11, 15, 12]")
        
        heap.remove(3)
        XCTAssertEqual(heap.description, "[4, 10, 12, 20, 11, 15]")

    }
}
