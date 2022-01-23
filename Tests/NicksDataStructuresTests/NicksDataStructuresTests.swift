import XCTest
@testable import NicksDataStructures

final class NicksDataStructuresTests: XCTestCase {
    func testBubbleSort() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        var array: [Int] = [4,2,6,21,1,7,5,34,12,54]

        array.bubbleSort()
        XCTAssertEqual(array, [1,2,4,5,6,7,12,21,34,54])
    }
    
    func testQuickSort() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        var array: [Int] = [4,2,6,21,1]

        array.quickSort()
        XCTAssertEqual(array, [1,2,4,6,21])
    }
    
    func testReverseString() throws {
        var str = "Hello World"
        
        str.reverseWords()
        
        XCTAssertEqual(str, "World Hello")
        
        var str1 = "This is a test of the String Reverse Method. It reverse the words in the string but not the letters in the words."
        
        str1.reverseWords()
        
        XCTAssertEqual(str1, "words. the in letters the not but string the in words the reverse It Method. Reverse String the of test a is This")
    }
    
    func testPalindrone() throws {
        let str = "aabbbaa"
        
        let count = str.numberOfPalindrones()
        
        XCTAssertEqual(count, 7)
    }
}
