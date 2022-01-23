//
//  PriorityQueueTests.swift
//  
//
//  Created by Nick Cracchiolo on 1/23/22.
//

import XCTest
@testable import NicksDataStructures

class PriorityQueueTests: XCTestCase {

    func testEnque() throws {
        var q = PriorityQueue<Int> { a, b in
            a < b
        }
        q.enque(10)
        XCTAssertEqual(q.description, "[10]")
        q.enque(15)
        XCTAssertEqual(q.description, "[10, 15]")
        q.enque(8)
        XCTAssertEqual(q.description, "[8, 15, 10]")
        q.enque(4)
        XCTAssertEqual(q.description, "[4, 8, 10, 15]")
    }
    
    func testDeque() throws {
        var q = PriorityQueue<Int> { a, b in
            a < b
        }
        let shouldBeNil = q.deque()
        XCTAssertEqual(shouldBeNil, nil)
        q.enque(10)
        q.enque(15)
        q.enque(8)
        q.enque(4)
        
        let a = q.deque()
        XCTAssertEqual(a, 4)
        let b = q.deque()
        XCTAssertEqual(b, 8)
        let c = q.deque()
        XCTAssertEqual(c, 10)
        let d = q.deque()
        XCTAssertEqual(d, 15)
    }

}
