//
//  LinkedListTests.swift
//  
//
//  Created by Nick Cracchiolo on 1/20/22.
//

import XCTest
@testable import NicksDataStructures

class LinkedListTests: XCTestCase {

    func testInsert() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        var list = LinkedList<Int>()
        list.append(10)
        XCTAssertEqual(list.toArray(), [10])
        
        list.append(5)
        let listArr = list.toArray()
        XCTAssertEqual(listArr, [10, 5])
    }
    
    func testPrepend() throws {
        var list = LinkedList<Int>()
        list.append(10)
        list.append(5)
        list.append(20)
        list.prepend(11)
        XCTAssertEqual(list.toArray(), [11, 10, 5, 20])
    }
    
    func testRemove() throws {
        var list = LinkedList<Int>()
        list.append(10)
        list.append(5)
        list.append(20)
        list.prepend(11)
        
        XCTAssertEqual(list.toArray(), [11, 10, 5, 20])
        
        list.remove(5)
        XCTAssertEqual(list.toArray(), [11, 10, 20])
        
        list.remove(11)
        XCTAssertEqual(list.toArray(), [10, 20])

        list.remove(20)
        XCTAssertEqual(list.toArray(), [10])
    }
    
    func testCount() throws {
        var list = LinkedList<Int>()
        list.append(10)
        list.append(5)
        list.append(20)
        XCTAssertEqual(list.count, 3)
        
        list.prepend(10)
        XCTAssertEqual(list.count, 4)
        
        list.remove(10)
        XCTAssertEqual(list.count, 3)
        
        list.append(1)
        list.prepend(2)
        XCTAssertEqual(list.count, 5)
    }
    
    func testIndexAt() throws {
        var list = LinkedList<Int>()
        list.append(10)
        list.append(5)
        list.append(20)
        
        XCTAssertEqual(list.value(atIndex: 0), 10)
        XCTAssertEqual(list.value(atIndex: 1), 5)
        XCTAssertEqual(list.value(atIndex: 2), 20)
    }
    
    func testDescription() throws {
        var list = LinkedList<Int>()
        list.append(10)
        list.append(5)
        list.append(20)
        list.append(15)
        list.append(41)
        
        XCTAssertEqual(list.description, "(10) -> (5) -> (20) -> (15) -> (41)")
    }
    
    func testAddition() throws {
        var list1 = LinkedList<Int>()
        list1.append(1)
        list1.append(2)
        list1.append(3)
        list1.append(4)
        list1.append(5)
        XCTAssertEqual(list1.toArray(), [1, 2, 3, 4, 5])
        
        var list2 = LinkedList<Int>()
        list2.append(10)
        list2.append(11)
        list2.append(12)
        list2.append(13)
        list2.append(14)
        list2.append(15)
        XCTAssertEqual(list2.toArray(), [10, 11, 12, 13, 14, 15])
        
        let list3 = list1 + list2
        XCTAssertEqual(list3.toArray(), [11, 13, 15, 17, 19, 15])
        let list4 = list2 + list1
        XCTAssertEqual(list4.toArray(), [11, 13, 15, 17, 19, 15])
        
        var list5 = LinkedList<Int>()
        list5.append(1)
        list5.append(2)
        list5.append(3)
        list5.append(4)
        list5.append(5)
        list5.append(6)
        list5.append(7)
        XCTAssertEqual(list5.toArray(), [1, 2, 3, 4, 5, 6, 7])
        
        let list6 = list5 + list1
        XCTAssertEqual(list6.toArray(), [2, 4, 6, 8, 10, 6, 7])
    }
    
    func testEquatable() throws {
        var list1 = LinkedList<Int>()
        list1.append(1)
        list1.append(2)
        list1.append(3)
        list1.append(4)
        list1.append(5)
        
        var list2 = LinkedList<Int>()
        list2.append(1)
        list2.append(2)
        list2.append(3)
        list2.append(4)
        list2.append(5)
        
        var list3 = LinkedList<Int>()
        list3.append(1)
        list3.append(2)
        list3.append(6)
        list3.append(4)
        list3.append(5)
        
        XCTAssertEqual(list1 == list2, true)
        XCTAssertEqual(list1 == list3, false)
    }
    
    func testRevered() throws {
        var list1 = LinkedList<Int>()
        list1.append(1)
        list1.append(2)
        list1.append(3)
        list1.append(4)
        list1.append(5)
        list1.append(6)
        list1.append(7)
        XCTAssertEqual(list1.toArray(), [1, 2, 3, 4, 5, 6, 7])
        
        let list2 = list1.reversed()
        XCTAssertEqual(list2.toArray(), [7, 6, 5, 4, 3, 2, 1])
    }
    
    func testSort() throws {
        var list1 = LinkedList<Int>()
        list1.append(1)
        list1.append(10)
        list1.append(3)
        list1.append(21)
        list1.append(16)
        list1.append(6)
        list1.append(37)
        
        list1.sort(ascending: true)
        XCTAssertEqual(list1.toArray(), [1, 3, 6, 10, 16, 21, 37])
        
        var list2 = LinkedList<Int>()
        list2.append(1)
        list2.append(10)
        list2.append(3)
        list2.append(21)
        list2.append(16)
        list2.append(6)
        list2.append(37)
        list2.sort(ascending: false)
        XCTAssertEqual(list2.toArray(), [37, 21, 16, 10, 6, 3, 1])
    }

    func testPerformanceAppend() throws {
        // This is an example of a performance test case.
        var list = LinkedList<Int>()
        self.measure {
            // Put the code you want to measure the time of here.
            list.append(10)
        }
    }
    
    func testPerformancePrepend() throws {
        // This is an example of a performance test case.
        var list = LinkedList<Int>()
        self.measure {
            // Put the code you want to measure the time of here.
            list.prepend(10)
        }
    }
    
    func testPerformanceRemove() throws {
        // This is an example of a performance test case.
        var list = LinkedList<Int>()
        list.append(10)
        list.append(20)
        list.append(5)
        list.append(30)
        self.measure {
            // Put the code you want to measure the time of here.
            list.remove(30)
        }
    }

}
